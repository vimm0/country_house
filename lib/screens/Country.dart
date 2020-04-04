import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map country;
  // Constructor
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.,
            title: Text(this.country['name'])),
        body: Container(
            padding: EdgeInsets.all(9.0),
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                CountryCard(title: 'Capital'),
                CountryCard(title: 'Population'),
                CountryCard(title: 'Flag'),
                CountryCard(title: 'Currency'),
                CountryCard(title: 'Show on map'),
              ],
            )));
  }
}

class CountryCard extends StatelessWidget {
  final String title;

  const CountryCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(this.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    );
  }
}
