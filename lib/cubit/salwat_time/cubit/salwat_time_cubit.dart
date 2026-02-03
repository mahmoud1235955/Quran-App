import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranapp/constant/extentions.dart';
import 'package:quranapp/models/salwat_time_model.dart';
import 'package:quranapp/services/salwat_time_api.dart';

part 'salwat_time_state.dart';

class SalwatTimeCubit extends Cubit<SalwatTimeState> {
  SalwatTimeCubit() : super(SalwatTimeLoading());

  void getSalwatTime({required String city}) async {
    try {
      emit(SalwatTimeLoading());
      SalwatTimeModel data = await SalwatTimeApi().getSalwatTime(city: city);
      emit(
        SalwatTimeLoaded(
          salwatTime: data,
          nextPray: data.nextPray,
          remainingTimeDuration: data.remainingTimeDuration,
        ),
      );
    } catch (e) {
      emit(SalwatTimeError(message: e.toString()));
    }
  }
}
