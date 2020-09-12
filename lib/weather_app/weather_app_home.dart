import 'package:all_in_one/weather_app/screens/city_screen.dart';
import 'package:all_in_one/weather_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one/weather_app/screens/loading_screen.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  static String id = 'weather_app';
  const WeatherApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LocationScreen(),
    );
  }
}