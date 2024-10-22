import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';
import 'city_screen.dart';
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();

  LocationScreen({required this.locationWeather});

  final locationWeather;

}

class _LocationScreenState extends State<LocationScreen> {

  double temperature = 0.0;
  int condition= 0;
  String cityName = "";
  String weatherIcon = "";
  String weatherMessage = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.locationWeather);
    updateUI(widget.locationWeather);
  }

  updateUI(dynamic weatherData){
    setState(() {
      print("update ui $weatherData");
      if(weatherData == null){
        temperature = 0.0;
        condition = 0;
        cityName = 'NOT FOUND';
        weatherIcon =  '⛔';
        weatherMessage = 'No Location Found.';
        print(widget.locationWeather);
        return ;
      }
      temperature = weatherData['main']['temp'];
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      print(widget.locationWeather);

      weatherIcon =  WeatherModel().getWeatherIcon(condition!);
      weatherMessage = WeatherModel().getMessage(temperature!.toInt());
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      dynamic weatherData = await WeatherModel().getCurrentLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      cityName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      dynamic weatherData = await WeatherModel().getWeatherByCity(cityName);
                      updateUI(weatherData);
                      print(WeatherModel().getWeatherByCity(cityName));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature!.toInt()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
