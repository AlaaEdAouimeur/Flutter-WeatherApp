import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: Text('Getting The Location And Weather '),
      ),
      backgroundColor: Colors.amberAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         
          
             Center(
             
               child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                //valueColor: Colors.blue,
            ),
             ),
         
        ],
      ),
    );
  }
}