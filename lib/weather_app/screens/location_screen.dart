import 'package:flutter/material.dart';
import 'package:all_in_one/weather_app/utilities/constants.dart';
import 'package:all_in_one/weather_app/services/weather.dart';
import 'package:all_in_one/weather_app/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather ;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  String cityName ;
  int temperature ;
  String weatherIcon ;
  String weatherMessage ;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    setState(() {

      if(weatherData == null){
        temperature = 0 ;
        weatherIcon = "Error";
        weatherMessage = "Sorry unable to get data";
        cityName = "";
        return ;
      }

      cityName = weatherData['name'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition); 
      weatherMessage = weather.getMessage(temperature);     
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Weather Info"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,         
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async{
              var weatherData = await weather.getLocationWeather();
              updateUI(weatherData);
            },
            heroTag: null,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(  
            backgroundColor: Colors.black,         
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () async{
              var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                return CityScreen();
              }));
              if(typedName != null) {
                var weatherData = await weather.getCityWeather(typedName);
                  updateUI(weatherData);
                }
              },
              heroTag: null,
            )
          ]
        ),

      body: Container(
        color: Colors.green[200],
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '$temperature°',
                        textAlign: TextAlign.center,
                        style: kTempTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 70.0),
                padding: EdgeInsets.all(25.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



