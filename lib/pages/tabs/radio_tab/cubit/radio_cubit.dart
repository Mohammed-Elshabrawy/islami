import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/api/api_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadioApi api;
  final AudioPlayer audioPlayer = AudioPlayer();

  RadioCubit() : api = _initApi(), super(RadioInitial()) {
    audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        playNextSurah();
      }
    });
  }

  static RadioApi _initApi() {
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
    return RadioApi(dio);
  }

  void getData() async {
    emit(RadioLoading());
    try {
      final radioResponse = await api.getRadios("en");
      final recitersResponse = await api.getReciters("en");
      
      emit(RadioSuccess(
        radios: radioResponse.radios ?? [],
        reciters: recitersResponse.reciters ?? [],
      ));
    } catch (e) {
      emit(RadioError(e.toString()));
    }
  }

  void toggleRadioPlay(int id, String url) async {
    final currentState = state;
    if (currentState is RadioSuccess) {
      if (currentState.playingRadioId == id && currentState.isPlaying) {
        await audioPlayer.stop();
        emit(currentState.copyWith(isPlaying: false));
      } else {
        try {
          emit(currentState.copyWith(
            playingRadioId: id,
            playingReciterId: null,
            playingSurahIndex: null,
            isPlaying: true,
          ));
          await audioPlayer.setUrl(url);
          await audioPlayer.play();
        } catch (e) {
          debugPrint("Error playing radio: $e");
          emit(currentState.copyWith(isPlaying: false));
        }
      }
    }
  }

  void toggleReciterPlay(int id, String serverUrl, {int? surahIndex}) async {
    final currentState = state;
    if (currentState is RadioSuccess) {
      final targetSurahIndex = surahIndex ?? 
          (currentState.playingReciterId == id ? (currentState.playingSurahIndex ?? 0) : 0);

      if (currentState.playingReciterId == id && 
          currentState.playingSurahIndex == targetSurahIndex && 
          currentState.isPlaying) {
        await audioPlayer.stop();
        emit(currentState.copyWith(isPlaying: false));
      } else {
        try {
          final reciter = currentState.reciters.firstWhere((r) => r.id == id);
          final surahList = reciter.moshaf?[0].surahList?.split(',') ?? [];
          
          if (targetSurahIndex >= 0 && targetSurahIndex < surahList.length) {
            final surahNumber = surahList[targetSurahIndex].padLeft(3, '0');
            final url = "$serverUrl$surahNumber.mp3";
            
            emit(currentState.copyWith(
              playingReciterId: id,
              playingRadioId: null,
              playingSurahIndex: targetSurahIndex,
              isPlaying: true,
            ));
            await audioPlayer.setUrl(url);
            await audioPlayer.play();
          }
        } catch (e) {
          debugPrint("Error playing reciter: $e");
          emit(currentState.copyWith(isPlaying: false));
        }
      }
    }
  }

  void playNextSurah({int? reciterId}) {
    final currentState = state;
    if (currentState is RadioSuccess) {
      final id = reciterId ?? currentState.playingReciterId;
      if (id == null) return;

      try {
        final reciter = currentState.reciters.firstWhere((r) => r.id == id);
        final serverUrl = reciter.moshaf?[0].server;
        final surahList = reciter.moshaf?[0].surahList?.split(',') ?? [];
        
        int currentIndex = (currentState.playingReciterId == id) ? (currentState.playingSurahIndex ?? 0) : -1;
        int nextIndex = currentIndex + 1;
        
        if (nextIndex < surahList.length && serverUrl != null) {
          toggleReciterPlay(id, serverUrl, surahIndex: nextIndex);
        }
      } catch (e) {
        debugPrint("Error playing next surah: $e");
      }
    }
  }

  void playPreviousSurah({int? reciterId}) {
    final currentState = state;
    if (currentState is RadioSuccess) {
      final id = reciterId ?? currentState.playingReciterId;
      if (id == null) return;

      try {
        final reciter = currentState.reciters.firstWhere((r) => r.id == id);
        final serverUrl = reciter.moshaf?[0].server;
        
        int currentIndex = (currentState.playingReciterId == id) ? (currentState.playingSurahIndex ?? 0) : 0;
        int prevIndex = currentIndex - 1;
        
        if (prevIndex >= 0 && serverUrl != null) {
          toggleReciterPlay(id, serverUrl, surahIndex: prevIndex);
        }
      } catch (e) {
        debugPrint("Error playing previous surah: $e");
      }
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
