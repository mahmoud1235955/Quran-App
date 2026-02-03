import 'package:quranapp/models/reciter_model.dart';

class AudioModel {
  final List<ReciterModel> reciters;

  AudioModel({required this.reciters});

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    List<ReciterModel> tempList = [];

    json.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        tempList.add(ReciterModel.fromJson(value));
      }
    });

    return AudioModel(reciters: tempList);
  }
}
