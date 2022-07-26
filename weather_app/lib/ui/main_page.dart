import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 15, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Enter city name",
                      contentPadding: EdgeInsets.all(8)),
                  onSubmitted: (value) =>
                      BlocProvider.of<WeatherBloc>(context).add(Search(value)),
                ),
              ),
              BlocConsumer<WeatherBloc, WeatherState>(
                builder: (BuildContext context, state) {
                  if (state is Idle) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.74,
                      child: Center(child: Text("please select a city")),
                    );
                  } else if (state is Loading) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            semanticsLabel: "Loading",
                          ),
                        ));
                  } else if (state is Loaded) {
                    return Column(children: [
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "${state.weatherForecast.city?.name}, ${state.weatherForecast.city?.country}", //city name, country name
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23.4),
                          ),
                          Text(
                            getFormattedDate(
                                DateTime.fromMillisecondsSinceEpoch(
                                    state.weatherForecast.list![0].dt *
                                        1000)), //don?: current date
                            style: TextStyle(fontSize: 20.4),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(children: [
                        Icon(
                          getCloudIcon(
                              state.weatherForecast.list![0].weather![0].main),
                          color: Colors.pink[400],
                          size: 250,
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${state.weatherForecast.list![0].temp?.day}\u00B0F", //current temprature
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                "${state.weatherForecast.list![0].weather![0].description}")
                          ],
                        )
                      ]),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${state.weatherForecast.list![0].speed} m/h", //wind speed
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.wind_power,
                                    color: Colors.brown[500],
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${state.weatherForecast.list![0].humidity}%", //emoji
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.emoji_emotions,
                                    color: Colors.brown[500],
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${state.weatherForecast.list![0].temp?.day}\u00B0F", //current temprature
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.thermostat,
                                    color: Colors.brown[500],
                                    size: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Column(
                        children: [
                          Text("7-DAY WEATHER FORCAST"),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 130,
                            child: ListView.builder(
                                itemCount: state.weatherForecast.cnt,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.purple[300],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(getDay(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      state.weatherForecast
                                                              .list![index].dt *
                                                          1000))), // don?: 7 days
                                            )),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: Center(
                                              child: Icon(
                                                getCloudIcon(state
                                                    .weatherForecast
                                                    .list![index]
                                                    .weather![0]
                                                    .main),
                                                color: Colors.pink[300],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            width: 70,
                                            margin: EdgeInsets.only(right: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${state.weatherForecast.list![index].temp?.min?.round()}\u00B0F", //min temprature
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_circle_down,
                                                      size: 15,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${state.weatherForecast.list![index].temp?.max?.round()}\u00B0F", //max temprature
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_circle_up,
                                                      size: 15,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "Hum:${state.weatherForecast.list![index].humidity}%", //humidity
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                                Text(
                                                  "win:${state.weatherForecast.list![index].speed?.round()} m/h", //wind speed
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      )
                    ]);
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.74,
                      child: Center(child: Text("please select a city")),
                    );
                  }
                },
                listenWhen: (p, c) => c is LoadingFailed,
                listener: (BuildContext context, Object? state) {
                  if (state is LoadingFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        elevation: 5,
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 3),
                        content:
                            Text("the city ${state.cityName} doesn't Exist")));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getDay(DateTime dt) {
    // dt = dt * 1000;
    return DateFormat('EEEE').format(dt);
  }

  String getFormattedDate(dt) {
    return DateFormat('EEEE, MMM d, yyyy').format(dt);
  }

  getCloudIcon(String? main) {
    if (main == "Clear") {
      return Icons.sunny;
    } else if (main == "Rain") {
      return Icons.cloudy_snowing;
    } else if (main == "Snow") {
      return Icons.snowing;
    } else {
      return Icons.cloud;
    }
  }
}
