import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longtude;

  //becouse the app doesnt know how much time it takes to complete this code
  //we use async and await to assign the value to the position after it gets the position no matter what

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
