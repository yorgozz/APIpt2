import 'cityModel.dart';

class StateModel {
  final String? idState;
  final String? stateName;
  final String? stateCode;
  final List<CityModel> cityList;

  StateModel({
    this.idState,
    this.stateName,
    this.stateCode,
    required this.cityList,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    var cityDataList = json['cityVOList'] as List<dynamic>;
    List<CityModel> cityList =
        cityDataList.map((item) => CityModel.fromJson(item)).toList();

    return StateModel(
      idState: json['idState'],
      stateName: json['stateName'],
      stateCode: json['stateCode'],
      cityList: cityList,
    );
  }
}
