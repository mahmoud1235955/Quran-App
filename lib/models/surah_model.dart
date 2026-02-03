class SuraModel {
  final String surahNameArabic;
  final String surahName;
  final String revelationPlace;
  final int totalAyah;

  SuraModel({
    required this.surahNameArabic,
    required this.surahName,
    required this.revelationPlace,
    required this.totalAyah,
  });

  factory SuraModel.fromJson(Map<String, dynamic> json) {
    return SuraModel(
      surahNameArabic: json['surahNameArabic'],
      surahName: json['surahName'],
      revelationPlace: json['revelationPlace'],
      totalAyah: json['totalAyah'],
    );
  }
}
