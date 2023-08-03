import 'package:flutter/material.dart';
import 'package:task6/models/countryModel.dart';
import 'package:task6/models/stateModel.dart';
import 'package:task6/models/cityModel.dart';
import 'package:task6/service/ProfileService.dart';
import 'package:task6/models/LanguageModel.dart';

class CompleteProfileProvider extends ChangeNotifier {
  CompleteProfileService _service = CompleteProfileService(
      baseUrl: 'http://192.168.88.10:30513/otonomus/common/api/v1');
  List<CountryModel> _countries = [];
  List<StateModel> _states = [];
  List<CityModel> _cities = [];
  List<LanguageModel> _languages = [];
  CountryModel? _selectedCountry;
  StateModel? _selectedState;
  CityModel? _selectedCity;
  LanguageModel? _selectedLanguage;

  List<CountryModel> get countries => _countries;
  List<StateModel> get states => _states;
  List<CityModel> get cities => _cities;
  List<LanguageModel> get languages => _languages;
  CountryModel? get selectedCountry => _selectedCountry;
  StateModel? get selectedState => _selectedState;
  CityModel? get selectedCity => _selectedCity;
  LanguageModel? get selectedLanguage => _selectedLanguage;

  Future<void> getAllCountries() async {
    try {
      _countries = await _service.getAllCountries();
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getStatesByCountryId(String countryId) async {
    try {
      _states = await _service.getStatesByCountryId(countryId);
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getCitiesByStateId(String stateId) async {
    try {
      _cities = await _service.getCitiesByStateId(stateId);
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getAllLanguages() async {
    try {
      _languages = await _service.getAllLanguages();
      notifyListeners();
    } catch (e) {}
  }

  void resetStates() {
    states.clear();
    notifyListeners();
  }

  void resetCities() {
    cities.clear();
    notifyListeners();
  }

  void setSelectedCountry(CountryModel? country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void setSelectedState(StateModel? state) {
    _selectedState = state;
    notifyListeners();
  }

  void setSelectedCity(CityModel? city) {
    _selectedCity = city;
    notifyListeners();
  }

  void setSelectedLanguage(LanguageModel? language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
