import 'package:flutter/material.dart';


import 'ui/weatherpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
   
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: MaterialColor(0xffffd740, {
            50 : Color(0xffffd740),
            100 : Color(0xffffd740),
            200 : Color(0xffffd740),
            300 :Color(0xffffd740),
            400 :  Color(0xffffd740),
            500 : Color(0xffffd740),

            600 : Color(0xffffd740),
            700 : Color(0xffffd740),
            800 : Color(0xffffd740),
            900 : Color(0xffffd740),
          }
          ),
        ),
        home: Weatherpage());
  }
}

