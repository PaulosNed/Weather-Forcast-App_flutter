import 'package:weather_app/models/Weather.dart';

abstract class WeatherState {}

class Idle extends WeatherState {}

class Loading extends WeatherState {}

class Loaded extends WeatherState {
  final WeatherForecast weatherForecast;

  Loaded(this.weatherForecast);
}

class LoadingFailed extends WeatherState {
  final String cityName;

  LoadingFailed(this.cityName);
}
