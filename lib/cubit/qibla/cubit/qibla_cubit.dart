import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit() : super(QiblaLoading());
  StreamSubscription? _subscription;
  Future<void> getQibla() async {
    try {
      emit(QiblaLoading());
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        _subscription = FlutterQiblah.qiblahStream.listen((qiblahDirection) {
          double angle = (qiblahDirection.direction * (pi / 180) * -1 + pi);
          double roundedAngle = double.parse(angle.toStringAsFixed(10));

          if ((state is QiblaLoaded &&
                  (state as QiblaLoaded).angle != roundedAngle) ||
              state is! QiblaLoaded) {
            emit(QiblaLoaded(angle: roundedAngle));
          }
        });
      }
    } catch (e) {
      emit(QiblaError(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
