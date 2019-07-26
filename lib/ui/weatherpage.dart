import 'Loadingpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/WeatherBrain/Dateandlocation.dart';
import 'package:flutter_weatherapp/WeatherBrain/Location.dart';
import 'package:flutter_weatherapp/WeatherBrain/Weather.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class Weatherpage extends StatefulWidget {
  @override
  _WeatherpageState createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  Color bg =  Color(0xff4b134f);
  Color fg = Color(0xffc94b4b);

  LocationService locationService;
  UserLocation userLocation;
  Weather weather;
  List forcast;
  Map Wther;

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

  IconData geticon(String icon) {
    switch (icon) {
      case '01d':
        return WeatherIcons.wiDaySunny;
      case '01n':
        return WeatherIcons.wiNightClear;

      case '02d':
        return WeatherIcons.wiNightPartlyCloudy;
      case '02n':
        return WeatherIcons.wiNightAltPartlyCloudy;

      case '03d':
        return WeatherIcons.wiCloudy;
      case '03n':
        return WeatherIcons.wiCloudy;

      case '04d':
        return WeatherIcons.wiNightPartlyCloudy;
      case '04n':
        return WeatherIcons.wiNightAltPartlyCloudy;

      case '050d':
        return WeatherIcons.wiDayFog;
      case '050':
        return WeatherIcons.wiNightFog;

      case '13d':
        return WeatherIcons.wiDaySnow;
      case '13n':
        return WeatherIcons.wiNightSnow;

      case '11d':
        return WeatherIcons.wiDayThunderstorm;
      case '11n':
        return WeatherIcons.wiNightThunderstorm;

      case '10d':
        return WeatherIcons.wiDayRain;
      case '10n':
        return WeatherIcons.wiNightRain;

      case '09d':
        return WeatherIcons.wiShowers;
      case '09n':
        return WeatherIcons.wiNightShowers;

        break;
      default:
        return WeatherIcons.from0Deg;
    }
  }

  Future getweather() async {
    Duration alaa = Duration(seconds: 200);
    Map _Wther = await weather.GetWeatherbyCor(userLocation);
    Map _Forecast = await weather.GetForcast(userLocation).timeout(alaa);

    setState(() {
      Wther = _Wther;
      temp = Wther['main']['temp'];
      forcast = _Forecast['list'];
    });
    print('forcast : $forcast');
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
    return Wther == null ? LoadingScreen() : Showweather();
  }

  Widget Showweather() {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'WEATHER',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: bg,
        elevation: 0,
        leading: Icon(Icons.ac_unit, color: Colors.white),
        actions: <Widget>[
             
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
           begin: FractionalOffset.topCenter,
           end:FractionalOffset.bottomCenter ,
            colors: [
              bg,fg
            ]
          )
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
              style: TextStyle(color: Colors.white , fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 170,
                  child: Text(
                    '${Wther['name']},${Wther['sys']['country']}',
                    style: TextStyle(wordSpacing: 50, fontSize: 25,color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.gps_fixed,color: Colors.white),
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
                  child: Icon(geticon(Wther['weather'][0]['icon']), size: 50,color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Text(
                    '${temp.toStringAsFixed(0)}°',
                    style: TextStyle(fontSize: 50,color: Colors.white),
                  ),
                )
              ],
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(
                  Radius.circular(25)
                )),
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${Wther['weather'][0]['main'].toString()}',
                        style:
                            TextStyle(fontSize: 25, color: Colors.white)),
                    Container(
                      color: Colors.white,
                      height: 20,
                      width: 1,
                    ),
                    Text('${Wther['weather'][0]['description'].toString()}',
                        style:
                            TextStyle(fontSize: 25, color: Colors.white)),
                    Container(
                      color: Colors.white,
                      height: 20,
                      width: 1,
                    ),
                    Text(
                      '${Wther['main']['humidity'].toString()}',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Icon(
                        WeatherIcons.wiHumidity,
                        color: Colors.white,
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
            Card(
              color: Colors.transparent,
              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(children: <Widget>[
                        Icon(Icons.drive_eta,color: Colors.white),
                        SizedBox(width:  8,),
                        Text('Driving difficulty',style: TextStyle(color: Colors.white,fontSize: 20),),
                        
                        SizedBox(width:  70,),
                        Text('None',style: TextStyle(color: Colors.white60,fontSize: 20))
                      ],),
                    )
                    ,
                    
                    Container(
                      color: Colors.white,
                      height: 1,
                      width: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(children: <Widget>[
                         Icon(Entypo.getIconData('flower'),color: Colors.white),
                         SizedBox(width:  8,),
                        Text('Polen',style: TextStyle(color: Colors.white,fontSize: 20)),
                         SizedBox(width:  125,),
                         Text('Moderate',style: TextStyle(color: Colors.white60,fontSize: 20))
                      ],),
                    ),
                    Container(color: Colors.white,
                      height: 1,
                      width: 300,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(children: <Widget>[
                         Icon(MaterialCommunityIcons.getIconData('shoe-formal'),color: Colors.white),
                          SizedBox(width:  8,),
                        Text('Running',style: TextStyle(color: Colors.white,fontSize: 20)),
                         SizedBox(width:  135,),
                         Text('Good',style: TextStyle(color: Colors.white60,fontSize: 20))
                      ],),
                    )
                  ],

              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ListView.separated(
                  itemCount: forcast.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return Cell(forcast[i], i,
                        geticon(forcast[i]['weather'][0]['icon']), today);
                  },
                  separatorBuilder: (BuildContext context, int i) {
                    return Container(
                      color: fg,
                      height: 25,
                      width: 1,
                    );
                  },
                ))
          ],
        ),
      ),
      backgroundColor: bg,
    );
  }
}

class Cell extends StatelessWidget {
  final Datetype today;
  final Map Forcast;
  final IconData iconData;
  final int i;

  Cell(this.Forcast, this.i, this.iconData, this.today);
  double temp;
  @override
  Widget build(BuildContext context) {
    temp = Forcast['main']['temp'];
    print('Forcast fuck : $Forcast');
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 4,
      decoration: new BoxDecoration(
          //   color :   Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(43))),
      child: Column(
        children: <Widget>[
          Padding(
            // DAY GOES HERE
            padding: const EdgeInsets.all(8),
            child: Text(
              '${today.day + i + 1}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          //ICON GOES HERE
          Text(
            '${today.month}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Icon(
            iconData,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 16,
          ),
          //WEATHER GOES HERE Forcast['weather']['main']
          Text(
            Forcast['weather'][0]['main'],
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '${temp.toStringAsFixed(0)}°',
            style: TextStyle(fontSize: 20,color: Colors.white),
          )
        ],
      ),
    );
  }
}
//#c94b4b
//#4b134f
