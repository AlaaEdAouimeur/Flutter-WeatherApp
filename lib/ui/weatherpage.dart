import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/WeatherBrain/Dateandlocation.dart';
import 'package:flutter_weatherapp/WeatherBrain/Location.dart';
import 'package:flutter_weatherapp/WeatherBrain/Weather.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class Weatherpage extends StatefulWidget {
  @override
  _WeatherpageState createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  LocationService locationService;
  UserLocation userLocation;
  Weather weather;
  Map Wther;
  var url = 'http://openweathermap.org/img/wn/10d@2x.png';
  fechdata() async {
    print('fetching');
    UserLocation _userLocation;
    _userLocation = await locationService.getLocation();
    setState(() {
      userLocation = _userLocation;
      print(userLocation);
    });
    await getweather();
  }

  Future getweather() async {
    Map _Wther = await weather.GetWeatherbyCor(userLocation);
    setState(() {
      Wther = _Wther;
      temp = Wther['main']['temp'];
    });
  }

  Datetype today;
  date Date;
  var temp;
  @override
  void initState() {
    super.initState();
    weather = new Weather();
    today = Datetype(0, "f", 2001);
    Date = new date();
    Date.getdate(today);
    locationService = new LocationService();

    fechdata();
    //print('userLocation = ${userLocation.latitude}');
    print('enterd');
  }

  @override
  Widget build(BuildContext context) {
    print(Wther);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WEATHER',
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        leading: Icon(Icons.ac_unit, color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            //TODO : Add The Foction That Returns The BAckgroud image depending on the weather
            /*  image: DecorationImage(
            image: AssetImage("images/azer.jpg"),
            fit: BoxFit.cover
          )*/
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              '${today.day} ${today.month} , ${today.year} ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '${Wther['name']},${Wther['sys']['country']}',
                  style: TextStyle(wordSpacing: 50, fontSize: 25),
                ),
                IconButton(
                  icon: Icon(Icons.gps_fixed),
                  onPressed: () {
                    fechdata();
                  },
                  iconSize: 25,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 30),
                  child: Icon(WeatherIcons.wiDaySunny,
                   
                      size: 50),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Text(
                    '${temp.toStringAsFixed(0)}°',
                    style: TextStyle(fontSize: 50),
                  ),
                )
              ],
            ),
            Center(
              child: Card(
                color: Colors.black,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                   
                   
                     Text('${Wther['weather'][0]['description'].toString()}',
                          style: TextStyle(
                              fontSize: 25, color: Colors.amberAccent)
                              ),
               Container(
                 color: Colors.amberAccent,
                 height: 20,
                 width: 1,
               ),
              Text(
               '${ Wther['main']['humidity'].toString()}%',
                style: TextStyle(
                  fontSize: 23,
                   color: Colors.amberAccent
                ),
              ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(0,0,0,15),
                 child: Icon(
                   WeatherIcons.wiRaindrop,
                   color: Colors.amber,
                   size: 40,
                 ),
               )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 00, 0, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Wther['name'],
                              //   Wther['weather'][0]['main'],
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  color: Colors.amberAccent),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 25,
                              width: 1,
                              color: Colors.amberAccent,
                            ),
                          ),
                          Icon(
                            Icons.hourglass_empty,
                            color: Colors.amberAccent,
                            size: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text('alaa'),
            Text('alaa')
          ],
        ),
      ),
      backgroundColor: Colors.amberAccent,
    );
  }
}
