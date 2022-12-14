import 'package:flutter_application_12/services/location.dart';
import 'package:flutter_application_12/services/networking.dart';

class WeatherModel {
  //https://api.openweathermap.org/data/2.5/weather?q=London&appid=0da9a0abde7a8197d6d688ff7cdfcbc5
  Future getCityWeather(cityName) async {
    print(cityName);
    NetworkHelper networkHelper = NetworkHelper(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': '$cityName',
          'appid': '0da9a0abde7a8197d6d688ff7cdfcbc5',
          'units': 'metric'
        },
      ),
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    location.printLocation();
    NetworkHelper networkHelper = NetworkHelper(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': '${location.Latitude}',
          'lon': '${location.Longitude}',
          'appid': '0da9a0abde7a8197d6d688ff7cdfcbc5',
          'units': 'metric'
        },
      ),
    );
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
