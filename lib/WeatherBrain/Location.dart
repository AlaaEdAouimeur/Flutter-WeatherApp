import 'dart:async';

import 'package:location/location.dart';

class LocationService {
  UserLocation _currentLocation;

  var location = Location();

  Future<UserLocation> getLocation() async {
    Duration timeout  = new Duration(minutes: 10);
    try {
      print('trying');
      var userLocation = await location.getLocation().timeout(timeout);
      print('done');
      _currentLocation = UserLocation(
        userLocation.latitude,
        userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    print('retrnd');
    return _currentLocation;
  }
}
 

 
class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation(this.latitude, this.longitude);

 
}