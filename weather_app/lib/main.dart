import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/ui/main_page.dart';

void main() {
  runApp(BlocProvider(
    create: (BuildContext context) => WeatherBloc(),
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: "Sans-serif",
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 30
          )
        )
      ),
      home: Feed(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
