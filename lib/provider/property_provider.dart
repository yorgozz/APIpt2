import 'package:flutter/material.dart';
import 'package:task6/models/propertyModel.dart';
import 'package:task6/service/property_service.dart';

class PropertyProvider extends ChangeNotifier {
  List<PropertyModel> _properties = [];
  List<PropertyModel> get properties => _properties;

  PropertyModel? _selectedProperty;
  PropertyModel? get selectedProperty => _selectedProperty;

  final PropertyService _propertyService = PropertyService();

  Future<void> fetchAllProperties() async {
    try {
      List<PropertyModel> fetchedProperties =
          await _propertyService.getAllAvailableProperties();
      _properties = fetchedProperties;
      setSelectedProperty(_properties.first);
      notifyListeners();
    } catch (e) {
      print('Error fetching properties: $e');
    }
  }

  void setSelectedProperty(PropertyModel property) {
    _selectedProperty = property;
    notifyListeners();
  }
}
