import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task6/models/countryModel.dart';
import 'package:task6/models/cityModel.dart';
import 'package:task6/models/stateModel.dart';
import 'package:task6/models/LanguageModel.dart';

class CompleteProfileService {
  final String baseUrl;

  CompleteProfileService({required this.baseUrl});

  Future<List<CountryModel>> getAllCountries() async {
    final response =
        await http.get(Uri.parse('$baseUrl/countries?page=0&size=300'));

    if (response.statusCode == 200) {
      print('fetched countries');
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final countries =
          result.map((map) => CountryModel.fromJson(map)).toList();
      return countries;
    } else {
      throw Exception('Failed to fetch countries');
    }
  }

  Future<List<StateModel>> getStatesByCountryId(String countryId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/country/$countryId/states'));

    if (response.statusCode == 200) {
      dynamic decodedResponse = json.decode(response.body);
      List<dynamic> dataList =
          decodedResponse is List ? decodedResponse : decodedResponse['data'];
      List<StateModel> stateList =
          dataList.map((item) => StateModel.fromJson(item)).toList();
      return stateList;
    } else {
      throw Exception('Failed to fetch states');
    }
  }

  Future<List<CityModel>> getCitiesByStateId(String stateId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/state/$stateId/cities'));
    print('fetched cities');
    if (response.statusCode == 200) {
      dynamic decodedResponse = json.decode(response.body);
      List<dynamic> dataList =
          decodedResponse is List ? decodedResponse : decodedResponse['data'];
      List<CityModel> cityList =
          dataList.map((item) => CityModel.fromJson(item)).toList();
      return cityList;
    } else {
      throw Exception('Failed to fetch cities');
    }
  }

  Future<List<LanguageModel>> getAllLanguages() async {
    final response =
        await http.get(Uri.parse('$baseUrl/languages?page=0&size=170'));

    if (response.statusCode == 200) {
      print('fetched languages');
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final languages =
          result.map((map) => LanguageModel.fromJson(map)).toList();
      return languages;
    } else {
      throw Exception('Failed to fetch languages');
    }
  }
}
