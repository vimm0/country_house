import 'package:country_house/screens/Country.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List> countries;
  Future<List> getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    // print(response.data);
    return response.data;
    // setState(() {
    // countries = response.data;
    // });
  }

  @override
  void initState() {
    countries = getCountries();
    print(countries);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final countryName = 'Nepal';
    // print(countries);
    // getCountries();
    return Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.,
            title: Text('All Countries')),
        body: Container(
            // child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<List>(
                future: countries,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Country(snapshot.data[index])));
                            // print("Hello");
                          },
                          child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                child: Text(
                                    snapshot.data[index]['name'],
                                    style: TextStyle(fontSize: 8)),
                              )));
                    });
                  }
                  return null;
                })
            // ListView(
            //   children: <Widget>[
            //     GestureDetector(
            //         onTap: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => Country("Nepal")));
            //           // print("Hello");
            //         },
            //         child: Card(
            //             elevation: 10,
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(
            //                   vertical: 10, horizontal: 8),
            //               child:
            //                   Text(countryName, style: TextStyle(fontSize: 8)),
            //             ))),
            //     GestureDetector(
            //         onTap: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => Country('India')));
            //           // print("Hello");
            //         },
            //         child: Card(
            //             elevation: 10,
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(
            //                   vertical: 10, horizontal: 8),
            //               child: Text('India', style: TextStyle(fontSize: 8)),
            //             ))),
            //   ],
            // )
            // )
            ));
  }
}
