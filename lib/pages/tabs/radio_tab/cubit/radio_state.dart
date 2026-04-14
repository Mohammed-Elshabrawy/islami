import '../../../../model/radio_response.dart';
import '../../../../model/reciter_response.dart';

abstract class RadioState {}

class RadioInitial extends RadioState {}

class RadioLoading extends RadioState {}

class RadioSuccess extends RadioState {
  final List<Radios> radios;
  final List<Reciters> reciters;
  final int? playingRadioId;
  final int? playingReciterId;
  final int? playingSurahIndex;
  final bool isPlaying;

  RadioSuccess({
    required this.radios,
    this.reciters = const [],
    this.playingRadioId,
    this.playingReciterId,
    this.playingSurahIndex,
    this.isPlaying = false,
  });

  RadioSuccess copyWith({
    List<Radios>? radios,
    List<Reciters>? reciters,
    int? playingRadioId,
    int? playingReciterId,
    int? playingSurahIndex,
    bool? isPlaying,
  }) {
    return RadioSuccess(
      radios: radios ?? this.radios,
      reciters: reciters ?? this.reciters,
      playingRadioId: playingRadioId ?? this.playingRadioId,
      playingReciterId: playingReciterId ?? this.playingReciterId,
      playingSurahIndex: playingSurahIndex ?? this.playingSurahIndex,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class RadioError extends RadioState {
  final String message;
  RadioError(this.message);
}
