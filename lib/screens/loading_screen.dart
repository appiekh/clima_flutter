import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // getData();
    getLocation();
  }


  // Latitude: 37.4054054054054, Longitude: -122.07727056202965
  void getLocation() async {

    dynamic weatherData = await WeatherModel().getCurrentLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
        )
      ),
    );
  }
}
