import 'package:flutter/foundation.dart';

import '../data/countries.dart';
import '../models/country.dart';

class CountryProvider extends ChangeNotifier {
  late int _selected;
  final List<Country> _countries = [];

  int get selectedCountry {
    return _selected;
  }

  List<Country> get countries {
    return [..._countries];
  }

  void changeSelection(String name) {
    _selected = _countries.indexWhere((element) => element.name == name);
    notifyListeners();
  }

  void loadCountries() {
    _countries.clear();
    countriesData.forEach((element) {
      _countries.add(Country.fromJson(element));
    });

    _selected = _countries.indexWhere(
      (element) => element.name == "Sri Lanka",
    );
    notifyListeners();
  }

  List<Country> searchCountry(String keyword) {
    return _countries
        .where((element) =>
            element.name.toLowerCase().startsWith(keyword.toLowerCase()))
        .toList();
  }
}
