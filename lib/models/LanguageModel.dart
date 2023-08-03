class LanguageModel {

  String languageId;
  String languageCode;
  String? languageDescription;

  LanguageModel({
    required this.languageId,
    required this.languageCode,
    required this.languageDescription,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        languageId: json["idLanguage"],
        languageCode: json["languageCode"],
        languageDescription: json["languageDescription"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idLanguage'] = this.languageId;
    data['languageCode'] = this.languageCode;
    data['languageDescription'] = this.languageDescription;
    return data;
  }

  @override
  String toString() {
    return 'LanguageModel(languageId: $languageId, languageCode: $languageCode, languageDescription: $languageDescription)';
  }
}
