import 'package:flutter/material.dart';
import 'package:weather_app/ui/main_page.dart';

void main() {
  runApp(MaterialApp(
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
  ));
}
