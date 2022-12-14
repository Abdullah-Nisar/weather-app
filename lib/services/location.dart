import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_12/screens/location_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location {
  double Latitude = -999.9;
  double Longitude = -999.9;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  void printLocation() {
    print('Latitude: ${Latitude}\n');
    print('Longitude:${Longitude}');
  }
}
