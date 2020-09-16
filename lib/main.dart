import 'package:all_in_one/calculator/calculator_home.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one/bill_splitter/bill_splitter.dart';
import 'package:all_in_one/app_home/welcome.dart';
import 'package:all_in_one/weather_app/weather_app_home.dart';
import 'package:all_in_one/todo_app/todo_app_home.dart';

void main() {
  runApp(AllInOne());
}

class AllInOne extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All In One App',
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black ,
          ),
        ),
      ),
      initialRoute : WelcomeScreen.id ,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        Calculator.id : (context) => Calculator(),
        BillSplitter.id : (context) => BillSplitter(),
        WeatherApp.id : (context) => WeatherApp(),
        ToDo.id : (context) => ToDo(),
      },
    );
  }
}

