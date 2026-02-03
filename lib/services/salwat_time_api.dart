import 'package:dio/dio.dart';
import 'package:quranapp/models/salwat_time_model.dart';

class SalwatTimeApi {
  static final SalwatTimeApi _instance = SalwatTimeApi._internal();
  factory SalwatTimeApi() => _instance;
  SalwatTimeApi._internal();
  Dio dio = Dio();
  Future<SalwatTimeModel> getSalwatTime({required String city}) async {
    Response response = await dio.get(
      'https://api.aladhan.com/v1/timingsByCity?city=$city&country=Egypt&method=5',
    );
    Map<String, dynamic> jsonData = response.data["data"]["timings"];
    return SalwatTimeModel.fromJson(jsonData);
  }
}
