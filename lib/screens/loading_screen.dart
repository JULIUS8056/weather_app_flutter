import 'package:flutter/material.dart';
import 'package:location_app_new/screens/location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location_app_new/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //double? latitude;
  //double? longitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '60';
    double? myMarginAsDouble;
    try {
      myMarginAsDouble = double.parse(myMargin);
    } catch (e) {
      print(e);
      //myMarginAsDouble = 30.0;
    }
    return Scaffold(
        body: Center(
            child: SpinKitFadingCircle(color: Colors.grey[500], size: 50.0)));
  }
}
