class ZekrModel {
  final String zekr;
  final int repeat;
  final String bless;
  ZekrModel({required this.zekr, required this.repeat, required this.bless});
  factory ZekrModel.fromJson(Map<String, dynamic> json) {
    return ZekrModel(
      zekr: json['zekr'],
      repeat: json['repeat'],
      bless: json['bless'],
    );
  }
}
