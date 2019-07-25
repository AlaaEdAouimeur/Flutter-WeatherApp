import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Map Forcast;

  final int i;
  
  Cell(this.Forcast,this.i);
  @override
  Widget build(BuildContext context) {
    print('Forcast : $Forcast');
    return Container(
           height: 150,
           width: MediaQuery.of(context).size.width/4,
            decoration: new BoxDecoration(
                color :   Colors.black,
                  borderRadius: new BorderRadius.all(Radius.circular(43))
                ),
            child: Column(
              children: <Widget>[
                Padding(
                  // DAY GOES HERE
                  padding: const EdgeInsets.all(8),
                  child: Text('25',style: TextStyle(color: Colors.amberAccent,fontSize: 25),),
                ),
                //ICON GOES HERE
                Icon(Icons.gamepad,color: Colors.amberAccent,size: 40,),
                SizedBox(height: 8,),
                //WEATHER GOES HERE Forcast['weather']['main']
                Text(Forcast['weather'][0]['main'],style: TextStyle(color: Colors.amberAccent,fontSize: 20),),
              ],
            ),
         );
  }
}