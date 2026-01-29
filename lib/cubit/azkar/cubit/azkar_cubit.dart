import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranapp/models/zekr_model.dart';
import 'package:quranapp/services/azkar_api.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarLoading());
  void getAzkar({required String endPoint}) async {
    try {
      emit(AzkarLoading());
      List<ZekrModel> data = await AzkarApi().getAzkar(endPoint: endPoint);
      emit(AzkarLoaded(azkarList: data));
    } catch (e) {
      emit(AzkarError(message: e.toString()));
    }
  }
}
