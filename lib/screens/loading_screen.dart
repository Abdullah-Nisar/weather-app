import 'package:flutter/material.dart';
import 'package:flutter_application_12/services/location.dart';
import 'package:flutter_application_12/screens/location_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    () async {
      await location.getLocation();
      location.printLocation();
      getData();
    };
  }

  @override
  Location location = Location();

  void getLocation() async {
    await location.getLocation();
    location.printLocation();
    // print("Latitude: ${location.Latitude}\n");
    // print("Longitude: ${location.Longitude}\n");
  }

  void getData() async {
    //https://api.openweathermap.org/data/2.5/weather?lat=37.4216863&lon=-122.0842&appid=0da9a0abde7a8197d6d688ff7cdfcbc5
    await location.getLocation();
    location.printLocation();
    // http.Response response = await http.get(
    //   Uri.https(
    //     'api.openweathermap.org',
    //     '/data/2.5/weather/',
    //     {
    //       'lat': '${location.Latitude}}',
    //       'lon': '${location.Longitude}}',
    //       'appid': '0da9a0abde7a8197d6d688ff7cdfcbc5'
    //     },
    //   ),
    // );
    http.Response response = await http.get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': '${location.Latitude}',
          'lon': '${location.Longitude}',
          'appid': '0da9a0abde7a8197d6d688ff7cdfcbc5'
        },
      ),
    );
    print(response.body);
    // if (response.statusCode == 200) {
    //   print(response.body);
    //   var result = jsonDecode(response.body);
    //   var temperature = result['main']['temp'];
    //   var condition = result['weather'][0]['description'];
    //   var city_name = result['name'];
    //   print('\nTemperature: $temperature\n');
    //   print('\nCondition: $condition\n');
    //   print('\nCity Name: $city_name\n');
    // } else {
    //   print(response.statusCode);
    // }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
