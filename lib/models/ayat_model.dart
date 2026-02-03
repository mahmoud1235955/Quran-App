import 'package:quranapp/models/audio_model.dart';

class AyatModel {
  final String? surahName;
  final String? revelationPlace;
  final int? ayahNo;
  final List<String>? arabic1;
  final AudioModel? audio;
  final int? surahNo;
  final List<String>? english;
  AyatModel({
    required this.surahName,
    required this.revelationPlace,
    required this.ayahNo,
    required this.audio,
    required this.arabic1,
    required this.english,
    required this.surahNo,
  });
  factory AyatModel.fromJson(Map<String, dynamic> json) {
    return AyatModel(
      surahName: json['surahName'],
      revelationPlace: json['revelationPlace'],
      ayahNo: json['ayahNo'],
      audio: AudioModel.fromJson(json['audio']),
      arabic1: List<String>.from(json['arabic1'] ?? []),
      english: List<String>.from(json['english'] ?? []),
      surahNo: json['surahNo'],
    );
  }
}
