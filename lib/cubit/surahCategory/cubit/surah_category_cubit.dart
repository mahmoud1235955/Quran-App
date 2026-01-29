import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranapp/models/surah_model.dart';
import 'package:quranapp/services/surah_api.dart';

part 'surah_category_state.dart';

class SurahCategoryCubit extends Cubit<SurahCategoryState> {
  SurahCategoryCubit() : super(SurahCategoryLoading()) {
    getCategory();
  }
  List<SurahModel> surah = [];
  void getCategory() async {
    try {
      emit(SurahCategoryLoading());
      List<SurahModel> data = await SurahApi().getSurah();
      surah = data;
      emit(SurahCategoryLoaded(surah: data, index: 0));
    } catch (e) {
      emit(SurahCategoryError(message: e.toString()));
    }
  }

  void changeIndex(int index) {
    emit(SurahCategoryLoaded(surah: surah, index: index));
  }
}
