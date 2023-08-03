import 'package:flutter/material.dart';
import 'package:task6/models/countryModel.dart';
import 'package:task6/models/stateModel.dart';
import 'package:task6/models/cityModel.dart';
import 'package:task6/models/LanguageModel.dart';

class DisplayInfoScreen extends StatelessWidget {
  final CountryModel? selectedCountry;
  final StateModel? selectedState;
  final CityModel? selectedCity;
  final LanguageModel? selectedLanguage;

  DisplayInfoScreen({
    required this.selectedCountry,
    required this.selectedState,
    required this.selectedCity,
    required this.selectedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selected Country: ${selectedCountry?.countryName ?? 'None'}'),
            Text('Selected State: ${selectedState?.stateName ?? 'None'}'),
            Text(
              'Selected City: ${selectedCity?.cityName ?? 'None'}',
            ),
            Text(
              'Selected Language: ${selectedLanguage?.languageDescription ?? 'None'}',
            ),
          ],
        ),
      ),
    );
  }
}
