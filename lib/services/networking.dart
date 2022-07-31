import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.uri);

  final uri;
  Future getData() async {
    //https://api.openweathermap.org/data/2.5/weather?lat=37.4216863&lon=-122.0842&appid=0da9a0abde7a8197d6d688ff7cdfcbc5

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      print(response.statusCode);
    }
  }
}
