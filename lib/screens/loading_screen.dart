import 'package:flutter/material.dart';
import 'package:flutter_application_12/services/location.dart';
import 'package:flutter_application_12/screens/location_screen.dart';
import 'package:flutter_application_12/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double Latitude = 0.0;
  double Longitude = 0.0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Location location = Location();

  void getLocationData() async {
    await location.getLocation();
    location.printLocation();
    Latitude = location.Latitude;
    Longitude = location.Longitude;
    NetworkHelper networkHelper = NetworkHelper(
      http.get(
        Uri.https(
          'api.openweathermap.org',
          '/data/2.5/weather',
          {
            'lat': '${location.Latitude}',
            'lon': '${location.Longitude}',
            'appid': '0da9a0abde7a8197d6d688ff7cdfcbc5'
          },
        ),
      ),
    );
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  // git remote add origin https://github.com/Abdullah-Nisar/weather-app-updated.git
  void getData() {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
      )
          // child: ElevatedButton(
          //   onPressed: () async {
          //     getLocationData();
          //   },
          //   child: Text('Get Location'),
          // ),
          ),
    );
  }
}
