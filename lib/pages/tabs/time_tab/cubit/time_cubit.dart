import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:islami/api/api_manager.dart';
import 'package:islami/model/prayer_time_response.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  final RestClient client;
  final AudioPlayer audioPlayer = AudioPlayer();
  Timer? _timer;
  PrayerTimeResponse? _lastResponse;
  DateTime? _lastResponseDate;
  Position? _currentPosition;

  TimeCubit() : client = _initClient(), super(TimeInitial()) {
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _updateAdhanState(false);
      }
    });
  }

  static RestClient _initClient() {
    final dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return RestClient(dio);
  }

  void loadPrayerTimes({DateTime? targetDate}) async {
    if (state is! TimeSuccess) {
      emit(TimeLoading());
    }
    
    try {
      _currentPosition ??= await _determinePosition();
      
      final date = targetDate ?? DateTime.now();
      final dateString = DateFormat('dd-MM-yyyy').format(date);
      
      final result = await client.getPrayerTimes(
        dateString,
        _currentPosition!.latitude.toString(),
        _currentPosition!.longitude.toString(),
      );
      
      _lastResponse = result;
      _lastResponseDate = date;
      _processSuccess(result, date);
      _startTimer();
    } catch (e) {
      try {
        final date = targetDate ?? DateTime.now();
        final dateString = DateFormat('dd-MM-yyyy').format(date);
        final result = await client.getPrayerTimes(dateString, "30.0444", "31.2357");
        _lastResponse = result;
        _lastResponseDate = date;
        _processSuccess(result, date);
        _startTimer();
      } catch (error) {
        emit(TimeError(error.toString()));
      }
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_lastResponse != null && _lastResponseDate != null) {
        _processSuccess(_lastResponse!, _lastResponseDate!);
      }
    });
  }

  void _processSuccess(PrayerTimeResponse response, DateTime timingsDate) {
    if (response.data?.timings == null) {
      emit(TimeError("No timings found"));
      return;
    }
    
    final nextPrayerData = getNextPrayer(response.data!.timings!, timingsDate);
    
    if (nextPrayerData['name'] == 'DONE') {
      _timer?.cancel();
      loadPrayerTimes(targetDate: DateTime.now().add(const Duration(days: 1)));
      return;
    }

    final initialIndex = [
      'Fajr',
      'Dhuhr',
      'Asr',
      'Maghrib',
      'Isha',
    ].indexOf(nextPrayerData['name']!);

    final currentState = state;
    bool isAdhanPlaying = false;
    if (currentState is TimeSuccess) {
      isAdhanPlaying = currentState.isAdhanPlaying;
    }

    if (nextPrayerData['remaining'] == "00:00:00" && !isAdhanPlaying) {
      playAdhanSound();
    }

    emit(TimeSuccess(
      response: response,
      nextPrayerData: nextPrayerData,
      initialIndex: initialIndex != -1 ? initialIndex : 0,
      isAdhanPlaying: isAdhanPlaying,
    ));
  }

  void toggleAdhan() {
    final currentState = state;
    if (currentState is TimeSuccess) {
      if (currentState.isAdhanPlaying) {
        stopAdhanSound();
      } else {
        playAdhanSound();
      }
    }
  }

  void playAdhanSound() async {
    try {
      _updateAdhanState(true);
      await audioPlayer.setUrl('https://cdn.aladhan.com/audio/adhans/a4.mp3');
      await audioPlayer.play();
    } catch (e) {
      debugPrint("Error playing adhan sound: $e");
      _updateAdhanState(false);
    }
  }

  void stopAdhanSound() async {
    try {
      await audioPlayer.stop();
      _updateAdhanState(false);
    } catch (e) {
      debugPrint("Error stopping adhan sound: $e");
    }
  }

  void _updateAdhanState(bool isPlaying) {
    final currentState = state;
    if (currentState is TimeSuccess) {
      emit(currentState.copyWith(isAdhanPlaying: isPlaying));
    }
  }

  Map<String, String> getNextPrayer(Timings timings, DateTime timingsDate) {
    final now = DateTime.now();
    final prayerList = [
      {'name': 'Fajr', 'time': timings.Fajr},
      {'name': 'Dhuhr', 'time': timings.Dhuhr},
      {'name': 'Asr', 'time': timings.Asr},
      {'name': 'Maghrib', 'time': timings.Maghrib},
      {'name': 'Isha', 'time': timings.Isha},
    ];

    for (var prayer in prayerList) {
      if (prayer['time'] != null) {
        final timeParts = prayer['time']!.split(' ')[0].split(':');
        final prayerTime = DateTime(
          timingsDate.year,
          timingsDate.month,
          timingsDate.day,
          int.parse(timeParts[0]),
          int.parse(timeParts[1]),
        );

        if (prayerTime.isAfter(now) || prayerTime.isAtSameMomentAs(now)) {
          final remaining = prayerTime.difference(now);
          final hours = remaining.inHours;
          final minutes = remaining.inMinutes % 60;
          final seconds = remaining.inSeconds % 60;
          return {
            'name': prayer['name']!,
            'remaining':
                "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
          };
        }
      }
    }

    return {'name': 'DONE', 'remaining': '00:00:00'};
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    audioPlayer.dispose();
    return super.close();
  }
}
