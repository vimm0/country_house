import 'package:country_house/screens/AllCountries.dart';
import 'package:country_house/screens/Country.dart';
import 'package:country_house/screens/CountryMap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new AllCountries(),
    routes: {
      CountryMap.routeName: (ctx) => CountryMap(),
      Country.routeName: (ctx) => Country(),
    },
  ));
}
