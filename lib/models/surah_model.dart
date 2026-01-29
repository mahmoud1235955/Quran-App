class SurahModel {
  final String surahNameArabic;
  final String surahName;
  final String revelationPlace;
  final int totalAyah;

  SurahModel({
    required this.surahNameArabic,
    required this.surahName,
    required this.revelationPlace,
    required this.totalAyah,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      surahNameArabic: json['surahNameArabic'],
      surahName: json['surahName'],
      revelationPlace: json['revelationPlace'],
      totalAyah: json['totalAyah'],
    );
  }
}
