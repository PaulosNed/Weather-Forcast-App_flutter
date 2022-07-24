abstract class WeatherEvent{}

class Search extends WeatherEvent{
  final String cityName;
  Search(
    this.cityName,
  );
}
