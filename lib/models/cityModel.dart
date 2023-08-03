class CityModel {
  final String? idCity;
  final String? cityName;

  CityModel({
    this.idCity,
    this.cityName,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      idCity: json['idCity'],
      cityName: json['cityName'],
    );
  }
}
