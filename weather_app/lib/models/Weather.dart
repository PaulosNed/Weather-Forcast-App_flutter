class WeatherForecast {
  City? city;
  String? cod;
  double? message;
  int? cnt;
  List<Lista>? list;

  WeatherForecast({this.city, this.cod, this.message, this.cnt, this.list});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    City? city1 = json['city'] != null ? new City.fromJson(json['city']) : null;
    String? cod1 = json['cod'];
    double? message1 = json['message'];
    int? cnt1 = json['cnt'];
    List<Lista> list1 = <Lista>[];
    if (json['list'] != null) {
      json['list'].forEach((v) {
        Lista lista = Lista.fromJson(v);
        list1.add(lista);
      });
    }
    WeatherForecast weatherForecast = WeatherForecast(
        city: city1, cod: cod1, message: message1, cnt: cnt1, list: list1);
    // print("############################################################");
    // print(weatherForecast.list![0].temp?.min);
    // print("############################################################");
    return weatherForecast;
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;

  City(this.id, this.name, this.coord, this.country, this.population,
      this.timezone);

  factory City.fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    var name = json['name'];
    var coord =
        json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    var country = json['country'];
    var population = json['population'];
    var timezone = json['timezone'];

    return City(id, name, coord, country, population, timezone);
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord(this.lon, this.lat);

  factory Coord.fromJson(Map<String, dynamic> json) {
    var lon = json['lon'];
    var lat = json['lat'];

    return Coord(lon, lat);
  }
}

class Lista {
  int dt;
  int? sunrise;
  int? sunset;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  List<Weather>? weather;
  double? speed;
  int? deg;
  double? gust;
  int? clouds;
  double? pop;
  double? rain;

  Lista(
      this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.gust,
      this.clouds,
      this.pop,
      this.rain);

  factory Lista.fromJson(Map<String, dynamic> json) {
    var dt = json['dt'];
    var sunrise = json['sunrise'];
    var sunset = json['sunset'];
    var temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    var feelsLike = json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : null;
    var pressure = json['pressure'];
    var humidity = json['humidity'];
    var weather = <Weather>[];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    var speed = json['speed'].toDouble();
    var deg = json['deg'];
    var gust = json['gust'].toDouble();
    var clouds = json['clouds'];
    var pop = json['pop'].toDouble();
    var rain = json['rain'];

    return Lista(dt, sunrise, sunset, temp, feelsLike, pressure, humidity,
        weather, speed, deg, gust, clouds, pop, rain);
  }
}

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp(this.day, this.min, this.max, this.night, this.eve, this.morn);

  factory Temp.fromJson(Map<String, dynamic> json) {
    var day = json['day'].toDouble();
    var min = json['min'].toDouble();
    var max = json['max'].toDouble();
    var night = json['night'].toDouble();
    var eve = json['eve'].toDouble();
    var morn = json['morn'].toDouble();

    return Temp(day, min, max, night, eve, morn);
  }
}

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike(this.day, this.night, this.eve, this.morn);

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    var day = json['day'].toDouble();
    var night = json['night'].toDouble();
    var eve = json['eve'].toDouble();
    var morn = json['morn'].toDouble();

    return FeelsLike(day, night, eve, morn);
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather(this.id, this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    var main = json['main'];
    var description = json['description'];
    var icon = json['icon'];

    return Weather(id, main, description, icon);
  }
}
