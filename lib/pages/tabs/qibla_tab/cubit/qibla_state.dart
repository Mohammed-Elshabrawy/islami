import 'package:flutter_qiblah/flutter_qiblah.dart';

abstract class QiblaState {}

class QiblaInitial extends QiblaState {}

class QiblaLoading extends QiblaState {}

class QiblaSuccess extends QiblaState {
  final QiblahDirection qiblahDirection;
  final bool isUnreliable;
  final bool isAligned;
  final bool dialogShown;

  QiblaSuccess({
    required this.qiblahDirection,
    this.isUnreliable = false,
    this.isAligned = false,
    this.dialogShown = false,
  });

  QiblaSuccess copyWith({
    QiblahDirection? qiblahDirection,
    bool? isUnreliable,
    bool? isAligned,
    bool? dialogShown,
  }) {
    return QiblaSuccess(
      qiblahDirection: qiblahDirection ?? this.qiblahDirection,
      isUnreliable: isUnreliable ?? this.isUnreliable,
      isAligned: isAligned ?? this.isAligned,
      dialogShown: dialogShown ?? this.dialogShown,
    );
  }
}

class QiblaError extends QiblaState {
  final String message;
  QiblaError(this.message);
}

class QiblaUnsupported extends QiblaState {}
