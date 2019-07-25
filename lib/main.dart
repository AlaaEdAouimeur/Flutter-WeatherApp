import 'package:flutter/material.dart';

import 'WeatherBrain/Location.dart';
import 'WeatherBrain/Weather.dart';
import 'ui/weatherpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Weatherpage());
  }
}

