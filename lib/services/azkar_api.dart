import 'package:dio/dio.dart';
import 'package:quranapp/models/zekr_model.dart';

class AzkarApi {
  static final AzkarApi _instance = AzkarApi._internal();
  factory AzkarApi() => _instance;
  AzkarApi._internal();
  Dio dio = Dio();
  Future<List<ZekrModel>> getAzkar({required String endPoint}) async {
    try {
      Response response = await dio.get(
        "https://ahegazy.github.io/muslimKit/json/$endPoint",
      );
      List<dynamic> jsonData = response.data["content"];
      List<ZekrModel> azkar = jsonData
          .map((e) => ZekrModel.fromJson(e))
          .toList();
      return azkar;
    } catch (e) {
      throw Exception(e);
    }
  }
}
