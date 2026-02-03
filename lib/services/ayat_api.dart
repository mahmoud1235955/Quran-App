import 'package:dio/dio.dart';
import 'package:quranapp/models/ayat_model.dart';

class AyatApi {
  static final AyatApi _instance = AyatApi._internal();
  factory AyatApi() => _instance;
  AyatApi._internal();
  Dio dio = Dio();
  Future<AyatModel> getAyat({required int surahNumber}) async {
    try {
      Response response = await dio.get(
        "https://quranapi.pages.dev/api/$surahNumber.json",
      );
      Map<String, dynamic> jsonData = response.data;

      return AyatModel.fromJson(jsonData);
    } catch (e) {
      throw Exception(e);
    }
  }
}
