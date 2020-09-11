import 'package:all_in_one/calculator/calculator_home.dart';
import 'package:all_in_one/bill_splitter/bill_splitter.dart';
import 'package:flutter/material.dart';
import 'package:all_in_one/todo_app/todo_app_home.dart';
import 'package:all_in_one/weather_app/weather_app_home.dart';
import 'package:all_in_one/movie_app/movie_app_home.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[200],
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                'All in One App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Calculator.id);
                  },
                  height: 20.0,
                  child: Text(
                    'Calculator',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BillSplitter.id);
                  },
                  height: 20.0,
                  child: Text(
                    'Bill Splitter',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, WeatherApp.id);
                  },
                  height: 20.0,
                  child: Text(
                    'Weather App',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, ToDo.id);
                  },
                  height: 20.0,
                  child: Text(
                    'Todo App',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 5.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, MovieApp.id);
                  },
                  height: 20.0,
                  child: Text(
                    'Movie App',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}