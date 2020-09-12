import 'package:all_in_one/weather_app/services/location.dart';
import 'package:all_in_one/weather_app/services/network.dart'; 

const apiKey = "ee6709a17168ec766ba4db8e864a0a38";
const startUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = "$startUrl?q=$cityName&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$startUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData(); 
    return weatherData ;
  }


  String getWeatherIcon(int condition){
    if(condition<300){
      return '🌩';
    }else if(condition<400){
      return '🌧';
    }else if(condition<600){
      return '☔️';
    }else if(condition<700){
      return '☃️';
    }else if(condition<800){
      return '🌫';
    }else if(condition==800){
      return '☀️';
    }else if(condition==804){
      return '☁️';
    }else{
      return '🤷‍';
    }
  }

  String getMessage(int temp){
    if(temp>35){
      return "It's really hot so have a 🍦 and enjoy";
    }else if(temp>20){
      return 'Moderate temperature , Time for shorts and 👕';
    }else if(temp<10){
      return 'You\'ll need 🧣 and 🧤';
    }else{
      return 'Bring a 🧥 just in case it Rains';
    }
  }



}