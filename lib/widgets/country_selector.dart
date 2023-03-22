import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sl_post_air_mail_calculator/models/country.dart';
import 'package:sl_post_air_mail_calculator/providers/country_provider.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector();

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  List<Country> _searchedCountries = [];

  @override
  Widget build(BuildContext context) {
    final countryProvider =
        Provider.of<CountryProvider>(context, listen: false);
    return TextButton.icon(
      onPressed: () {
        _searchedCountries.clear();
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (BuildContext context,
                    void Function(void Function()) setState) =>
                AlertDialog(
              title: TextField(
                decoration: InputDecoration(hintText: "Search a country"),
                maxLength: 20,
                onChanged: (value) {
                  final countryProvider =
                      Provider.of<CountryProvider>(context, listen: false);
                  _searchedCountries.clear();
                  setState(() {
                    _searchedCountries = countryProvider.searchCountry(value);
                  });
                },
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  addAutomaticKeepAlives: false,
                  itemCount: _searchedCountries.isEmpty
                      ? countryProvider.countries.length
                      : _searchedCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_searchedCountries.isEmpty
                          ? countryProvider.countries[index].name
                          : _searchedCountries[index].name),
                      selected: _searchedCountries.isEmpty
                          ? index == countryProvider.selectedCountry
                          : _searchedCountries[index].name ==
                              countryProvider
                                  .countries[countryProvider.selectedCountry]
                                  .name,
                      onTap: () {
                        countryProvider.changeSelection(
                            _searchedCountries.isEmpty
                                ? countryProvider.countries[index].name
                                : _searchedCountries[index].name);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      icon: Icon(Icons.pin_drop),
      label: Consumer<CountryProvider>(builder: (context, provider, ch) {
        return Text(
          provider.countries[provider.selectedCountry].name,
        );
      }),
    );
  }
}
