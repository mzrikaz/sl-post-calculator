import 'package:flutter/foundation.dart';
import 'package:sl_post_air_mail_calculator/data/local_rates.dart';
import 'package:sl_post_air_mail_calculator/data/zones.dart';

import '../data/countries.dart';
import '../models/country.dart';

class CountryProvider extends ChangeNotifier {
  late int _selected;
  final List<Country> _countries = [];
  int _weight = 0;

  Map<String, dynamic> _localMail = {
    "letter": 0,
    "parcel": 0,
    "courier": 0,
    "newspaper": 0,
    "open_article": 0,
    "on_state": 0,
    "basket": 0,
  };

  Map<String, dynamic> _airMail = {
    "letter": 0,
    "u_packets": 0,
    "printed": 0,
  };

  void reset() {
    _localMail = {
      "letter": 0,
      "parcel": 0,
      "courier": 0,
      "newspaper": 0,
      "open_article": 0,
      "on_state": 0,
      "basket": 0,
    };
    _airMail = {
      "letter": 0,
      "u_packets": 0,
      "printed": 0,
    };
    notifyListeners();
  }

  int get selectedCountry {
    return _selected;
  }

  List<Country> get countries {
    return [..._countries];
  }

  Map<String, dynamic> get localMail {
    return _localMail;
  }

  Map<String, dynamic> get airMail {
    return _airMail;
  }

  void changeSelection(String name) {
    _selected = _countries.indexWhere((element) => element.name == name);
    calculate(_weight);
  }

  void loadCountries() {
    _countries.clear();
    countriesData.forEach((element) {
      _countries.add(Country.fromJson(element));
    });

    _selected = 0;
    notifyListeners();
  }

  List<Country> searchCountry(String keyword) {
    calculate(98);
    return _countries
        .where((element) =>
            element.name.toLowerCase().startsWith(keyword.toLowerCase()))
        .toList();
  }

  void calculate(int weight) {
    _weight = weight;
    final zone = zones[_countries[_selected].zone];

    _localMail = {
      "letter": getLocalLetterRate(weight),
      "parcel": getLocalParcelRate(weight),
      "courier": getLocalCourierRate(weight),
      "newspaper": getLocalNewspaperRate(weight),
      "open_article": getLocalOpenArticleRate(weight),
      "on_state": getLocalOnStateRate(weight),
      "basket": getLocalBasketRate(weight),
    };

    _airMail = {
      "letter": getRate(
        weight,
        zone["airmail_rates"]["letters"][0],
        zone["airmail_rates"]["letters"][1],
        zone["airmail_rates"]["letters"][2],
        zone["airmail_rates"]["letters"][3],
        zone["airmail_rates"]["letters"][4],
      ),
      "u_packets": getRate(
        weight,
        zone["airmail_rates"]["u_packets"][0],
        zone["airmail_rates"]["u_packets"][1],
        zone["airmail_rates"]["u_packets"][2],
        zone["airmail_rates"]["u_packets"][3],
        zone["airmail_rates"]["u_packets"][4],
      ),
      "printed": getRate(
        weight,
        zone["airmail_rates"]["printed"][0],
        zone["airmail_rates"]["printed"][1],
        zone["airmail_rates"]["printed"][2],
        zone["airmail_rates"]["printed"][3],
        zone["airmail_rates"]["printed"][4],
      ),
    };

    notifyListeners();
  }

  int getRate(int weight, int basePrice, int additionalPrice, int baseWeight,
      int additionalWeight, int max) {
    if (weight <= 0 || weight > max) {
      return 0;
    } else if (weight <= baseWeight) {
      return basePrice;
    } else {
      int newWeight = weight - baseWeight;
      int newWeightTime = (newWeight / additionalWeight).ceil();
      return basePrice + (newWeightTime * additionalPrice);
    }
  }
}
