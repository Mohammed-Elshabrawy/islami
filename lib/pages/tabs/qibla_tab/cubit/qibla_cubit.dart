import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass_v2/flutter_compass_v2.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:stream_transform/stream_transform.dart';
import 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  StreamSubscription? _qiblaSubscription;
  DateTime _lastVibration = DateTime.now();

  QiblaCubit() : super(QiblaInitial());

  void checkSensorSupport() async {
    emit(QiblaLoading());
    try {
      final support = await FlutterQiblah.androidDeviceSensorSupport();
      if (support == false) {
        emit(QiblaUnsupported());
      } else {
        _startListening();
      }
    } catch (e) {
      emit(QiblaError(e.toString()));
    }
  }

  void _startListening() {
    // Combine compass events and qiblah stream to get all info in one place
    final compassStream = FlutterCompass.events!;
    final qiblahStream = FlutterQiblah.qiblahStream;

    _qiblaSubscription = compassStream.combineLatest(qiblahStream, (CompassEvent compass, QiblahDirection qibla) {
      return _processData(compass, qibla);
    }).listen((state) {
      if (state is QiblaSuccess) {
        _handleVibration(state);
      }
      emit(state);
    }, onError: (error) {
      emit(QiblaError(error.toString()));
    });
  }

  QiblaState _processData(CompassEvent compass, QiblahDirection qibla) {
    // Check for sensor reliability (null: unreliable, > 30: low accuracy on Android)
    bool isUnreliable = compass.accuracy == null || compass.accuracy! > 30;

    double qiblahAngle = qibla.qiblah % 360;
    bool isAligned = qiblahAngle < 5 || qiblahAngle > 355;

    final currentState = state;
    bool dialogShown = false;
    if (currentState is QiblaSuccess) {
      dialogShown = currentState.dialogShown;
    }

    // If it becomes unreliable and we haven't shown the dialog in this "session" yet
    if (isUnreliable && !dialogShown) {
      // We don't set dialogShown to true here because the UI will trigger it
      // and we want the UI to tell us when it's done.
    }

    return QiblaSuccess(
      qiblahDirection: qibla,
      isUnreliable: isUnreliable,
      isAligned: isAligned,
      dialogShown: dialogShown,
    );
  }

  void _handleVibration(QiblaSuccess successState) {
    if (successState.isAligned) {
      if (DateTime.now().difference(_lastVibration).inMilliseconds > 500) {
        HapticFeedback.vibrate();
        _lastVibration = DateTime.now();
      }
    }
  }

  void setDialogShown(bool shown) {
    final currentState = state;
    if (currentState is QiblaSuccess) {
      emit(currentState.copyWith(dialogShown: shown));
    }
  }

  @override
  Future<void> close() {
    _qiblaSubscription?.cancel();
    return super.close();
  }
}
