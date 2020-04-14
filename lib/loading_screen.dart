
import 'package:climate_check/weather.dart';
import 'package:flutter/material.dart';

import 'location.dart';
import 'location_screen.dart';
import 'networking.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    WeatherModel wm = WeatherModel();
    var weatherData = await wm.getLocationWeather();


   Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData)));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80
        )
      )
    );
  }

}