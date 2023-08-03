import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/models/countryModel.dart';
import 'package:task6/models/stateModel.dart';
import 'package:task6/models/cityModel.dart';
import 'package:task6/models/LanguageModel.dart';
import 'package:task6/provider/completeProfileProvider.dart';
import 'package:task6/presentation/screens/displayinfo.dart';

class InfoFillScreen extends StatefulWidget {
  @override
  _InfoFillScreenState createState() => _InfoFillScreenState();
}

class _InfoFillScreenState extends State<InfoFillScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CompleteProfileProvider>(context, listen: false)
        .getAllCountries();
    Provider.of<CompleteProfileProvider>(context, listen: false)
        .getAllLanguages();
  }

  @override
  Widget build(BuildContext context) {
    var completeProfileProvider = Provider.of<CompleteProfileProvider>(context);
    var countries = completeProfileProvider.countries;
    var states = completeProfileProvider.states;
    var cities = completeProfileProvider.cities;
    var languages = completeProfileProvider.languages;
    var selectedCountry = completeProfileProvider.selectedCountry;
    var selectedState = completeProfileProvider.selectedState;
    var selectedCity = completeProfileProvider.selectedCity;
    var selectedLanguage = completeProfileProvider.selectedLanguage;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.0),
          Center(
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 60.0,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<CountryModel>(
                        isExpanded: true,
                        value: selectedCountry,
                        hint: Text('Select a country'),
                        onChanged: (newValue) {
                          completeProfileProvider.setSelectedCountry(newValue);

                          completeProfileProvider.resetStates();
                          completeProfileProvider.resetCities();

                          completeProfileProvider.setSelectedState(null);
                          completeProfileProvider.setSelectedCity(null);

                          if (newValue != null) {
                            completeProfileProvider
                                .getStatesByCountryId(newValue.countryId!);
                          }
                        },
                        items: countries.map((country) {
                          return DropdownMenuItem<CountryModel>(
                            value: country,
                            child: Text(country.countryName!),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<StateModel>(
                        isExpanded: true,
                        value: selectedState,
                        hint: Text('Select a state'),
                        onChanged: (newValue) {
                          completeProfileProvider.setSelectedState(newValue);

                          completeProfileProvider.resetCities();
                          completeProfileProvider.setSelectedCity(null);

                          if (newValue != null) {
                            completeProfileProvider
                                .getCitiesByStateId(newValue.idState!);
                          }
                        },
                        items: states.map((state) {
                          return DropdownMenuItem<StateModel>(
                            value: state,
                            child: Text(state.stateName!),
                          );
                        }).toList(),
                        onTap: selectedCountry == null
                            ? () {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            : null,
                        dropdownColor:
                            selectedCountry == null ? Colors.grey : null,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<CityModel>(
                        isExpanded: true,
                        value: selectedCity,
                        hint: Text('Select a city'),
                        onChanged: (newValue) {
                          completeProfileProvider.setSelectedCity(newValue);
                        },
                        items: cities.map((city) {
                          return DropdownMenuItem<CityModel>(
                            value: city,
                            child: Text(city.cityName!),
                          );
                        }).toList(),
                        onTap: selectedState == null
                            ? () {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            : null,
                        dropdownColor:
                            selectedState == null ? Colors.grey : null,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<LanguageModel>(
                        isExpanded: true,
                        value: selectedLanguage,
                        hint: Text('Select a language'),
                        onChanged: (newValue) {
                          completeProfileProvider.setSelectedLanguage(newValue);
                        },
                        items: languages.map((language) {
                          return DropdownMenuItem<LanguageModel>(
                            value: language,
                            child: Text(language.languageDescription!),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayInfoScreen(
                                selectedCountry: selectedCountry,
                                selectedState: selectedState,
                                selectedCity: selectedCity,
                                selectedLanguage: selectedLanguage,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
