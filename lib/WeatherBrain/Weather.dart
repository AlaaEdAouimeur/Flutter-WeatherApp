import 'dart:convert';

import 'package:http/http.dart'as http;

import 'Location.dart';


class Weather {
    
  
   Future GetWeatherbyCor(UserLocation userLocation)async {
   Map weather;
   var apikey = '75c7370c4206ebdf26a1dee238708e55';

      var url = 'http://api.openweathermap.org/data/2.5/weather?lat=${userLocation.latitude}&lon=${userLocation.longitude}&appid=$apikey&units=metric';
    
    http.Response httpResponse = await http.get(url);
   weather = json.decode(httpResponse.body);
  // weather = weather['weather'];
   if (weather.isNotEmpty){
   print(weather);
    return weather;
   }
   else print('null');
  }
   GetWeatherbyString(String City)async {
   
   var apikey = '75c7370c4206ebdf26a1dee238708e55';
  
    var url = 'http://api.openweathermap.org/data/2.5/weather?q=$City&APPID=$apikey';
   
    Map Weather;
    http.Response httpResponse = await http.get(url);
   Weather = json.decode(httpResponse.body);
   if (Weather.isNotEmpty){
   print(Weather);
   return Weather;
   }
   else print('null');
  }
}