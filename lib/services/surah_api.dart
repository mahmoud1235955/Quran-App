import 'package:dio/dio.dart';
import 'package:quranapp/models/surah_model.dart';

class SurahApi {
  Dio dio = Dio();
  static final SurahApi _instance = SurahApi._internal();
  SurahApi._internal();
  factory SurahApi() => _instance;
  Future<List<SurahModel>> getSurah() async {
    final Response response = await dio.get(
      "https://quranapi.pages.dev/api/surah.json",
    );
    List<dynamic> jsonData = response.data;
    List<SurahModel> surah = jsonData
        .map((e) => SurahModel.fromJson(e))
        .toList();
    return surah;
  }
}
