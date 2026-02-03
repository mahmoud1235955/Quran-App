import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranapp/models/ayat_model.dart';
import 'package:quranapp/services/ayat_api.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit() : super(AyatLoading());
  void getAyah({required int surahNumber}) async {
    try {
      emit(AyatLoading());
      AyatModel data = await AyatApi().getAyat(surahNumber: surahNumber);
      emit(AyatLoaded(ayatList: data));
    } catch (e) {
      emit(AyatError(message: e.toString()));
    }
  }
}
