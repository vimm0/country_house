import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryMap extends StatelessWidget {
  // final String name;
  // final List latlang;
  // CountryMap({this.name, this.latlang});
  final Completer<GoogleMapController> _controller = Completer();

  static const routeName = '/country-map';
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(this.latlang[0], this.latlang[1]),
  //   zoom: 14.4746,
  // );

  @override
  Widget build(BuildContext context) {
    final Map country = ModalRoute.of(context).settings.arguments;

    // print(name);
    // print(latlang);
    return Scaffold(
        appBar: AppBar(title: Text(country['name'])),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(country['latlng'][0], country['latlng'][1]),
            zoom: 5,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}
