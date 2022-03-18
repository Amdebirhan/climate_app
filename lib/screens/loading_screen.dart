import 'package:climate_app/screens/location_screen.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//api key from whthermap.com
const apikey = '0747abaa51eb2f5820e6d2a0ae7651dc';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longtude;
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    //get the current location of the user from the location class
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtude = location.longtude;
    //send the user location to the network class with owr api key in order to get the
    //whether of the user from his/her position
    NetworkHelper netHelper =
        NetworkHelper('https://api.openweathermap.org/data/2.5/weather?'
            'lat=$latitude&lon=$longtude&appid=$apikey&units=metric');
    var weatherdata = await netHelper.GetData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherdata: weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
