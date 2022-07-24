import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/Weather.dart';

class RemoteProvider {
  get(cityName) async {
    final response = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast/daily?q=${cityName}&appid=ed60fcfbd110ee65c7150605ea8aceea&units=imperial"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      print("found!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      print("NOTTTTTTTTTTTTTTTTTTTTTT");
      throw Exception("Unable to find $cityName in list of cities");
    }
  }
}
