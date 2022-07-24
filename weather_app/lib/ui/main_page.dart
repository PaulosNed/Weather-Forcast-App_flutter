import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';

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
                  onSubmitted: (value) => BlocProvider.of<WeatherBloc>(context).add(Search(value)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                    "Moscow, RU", //city name, country name
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23.4),
                  ),
                  Text(
                    "Saturday, Dec 14, 2021", //current date
                    style: TextStyle(fontSize: 20.4),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Column(children: [
                Icon(
                  Icons.cloud,
                  color: Colors.pink[400],
                  size: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "73\u00B0F", //current temprature
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("FEW CLOUDS") //cloud status
                  ],
                )
              ]),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1.9 m/h", //wind speed
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "76 %", //emoji
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "73\u00B0F", //current temprature
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 11,
                      ),
                      Icon(
                        Icons.wind_power,
                        color: Colors.brown[500],
                        size: 20,
                      ),
                      SizedBox(
                        width: 37,
                      ),
                      Icon(
                        Icons.emoji_emotions,
                        color: Colors.brown[500],
                        size: 20,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.thermostat,
                        color: Colors.brown[500],
                        size: 20,
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
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.purple[300],
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text("Saturday"), // day
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
                                        Icons.cloud,
                                        color:
                                            Colors.pink[300], //cloud of the day
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
                                              "66 \u00B0F", //min temprature
                                              style: TextStyle(fontSize: 13),
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
                                              "92 \u00B0F", //max temprature
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            Icon(
                                              Icons.arrow_circle_up,
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        Text(
                                          "Hum: 45%", //humidity
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          "win: 2 m/h", //wind speed
                                          style: TextStyle(fontSize: 13),
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
            ],
          ),
        ),
      ),
    );
  }
}
