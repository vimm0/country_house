import 'package:country_house/screens/Country.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;
  getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });
    // print(countries);
    super.initState();
  }

  void _filterCountries(value) {
    print(value);
    setState(() {
      filteredCountries = countries
          .where((country) =>
              country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final countryName = 'Nepal';
    // print(countries);
    // getCountries();
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.,
          title: !isSearching
              ? Text('All Countries')
              : TextField(
                  onChanged: (value) {
                    _filterCountries(value);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white),
                      hintText: 'What are you looking for?',
                      hintStyle: TextStyle(color: Colors.white))),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                        this.filteredCountries = this.countries;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    })
          ],
        ),
        body: Container(
            // child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: filteredCountries.length > 0
                ? ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Country(filteredCountries[index])));
                            // print("Hello");
                          },
                          child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                child: Text(filteredCountries[index]['name'],
                                    style: TextStyle(fontSize: 8)),
                              )));
                    })
                : Center(child: CircularProgressIndicator())));
  }
}
