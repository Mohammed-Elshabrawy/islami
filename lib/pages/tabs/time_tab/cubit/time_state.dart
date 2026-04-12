import '../../../../model/prayer_time_response.dart';

abstract class TimeState {}

class TimeInitial extends TimeState {}

class TimeLoading extends TimeState {}

class TimeSuccess extends TimeState {
  final PrayerTimeResponse response;
  final Map<String, String> nextPrayerData;
  final int initialIndex;
  final bool isAdhanPlaying;

  TimeSuccess({
    required this.response,
    required this.nextPrayerData,
    required this.initialIndex,
    this.isAdhanPlaying = false,
  });

  TimeSuccess copyWith({
    PrayerTimeResponse? response,
    Map<String, String>? nextPrayerData,
    int? initialIndex,
    bool? isAdhanPlaying,
  }) {
    return TimeSuccess(
      response: response ?? this.response,
      nextPrayerData: nextPrayerData ?? this.nextPrayerData,
      initialIndex: initialIndex ?? this.initialIndex,
      isAdhanPlaying: isAdhanPlaying ?? this.isAdhanPlaying,
    );
  }
}

class TimeError extends TimeState {
  final String message;
  TimeError(this.message);
}
