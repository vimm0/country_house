import 'package:country_house/screens/CountryMap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;
  // Constructor
  Country(this.country);
  

  @override
  Widget build(BuildContext context) {
    print(country);

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
                FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: CountryCard(title: 'Capital'),
                    back: CountryDetailCard(
                        title: country['capital'], color: Colors.deepOrange)),
                FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: CountryCard(title: 'Population'),
                    back: CountryDetailCard(
                        title: country['population'].toString(),
                        color: Colors.deepPurple)),
                FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: CountryCard(title: 'Flag'),
                    back: Card(
                        // color: Colors.lime,
                        elevation: 10,
                        child: Center(
                          child: SvgPicture.network(country['flag']),
                        ))),
                // back: CountryDetailCard(title: country['flag'], color: Colors.cyan)),
                FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: CountryCard(title: 'Currency'),
                    back: CountryDetailCard(
                        title: country['currencies'][0]['name'],
                        color: Colors.lightBlue)),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => CountryMap(name: country['name'], latlang: country['latlng'],)));
                    },
                    child: CountryCard(title: 'Show on map')),
              ],
            )));
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  final MaterialColor color;
  CountryDetailCard({this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        elevation: 10,
        child: Center(
          child: Text(title, style: TextStyle(color: Colors.white)),
        ));
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
