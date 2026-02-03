class ReciterModel {
  final String name;
  final String url;
  ReciterModel({required this.name, required this.url});

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(name: json['reciter'], url: json['url']);
  }
}
