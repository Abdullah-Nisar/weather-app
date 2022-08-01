import 'package:flutter/material.dart';
import 'package:flutter_application_12/screens/location_screen.dart';
import 'package:flutter_application_12/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
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
          ),
    );
  }
}
