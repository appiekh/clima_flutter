import 'location.dart';
import 'networking.dart';
class WeatherModel {


  String apiKey = "0f1bebfd2ba98014701503fbda929d52";
  String openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather?";

  Future<dynamic>getWeatherByCity(String cityName) async{
    String url = "${openWeatherMapURL}q=${cityName}&appid=${apiKey}&units=metric";
    NetworkHelper  networkHelper = NetworkHelper(url:url);
    return await networkHelper.getData();
    }
  Future<dynamic> getCurrentLocation() async{
    Location location = Location();
    await location.getLocation();
    NetworkHelper  networkHelper = NetworkHelper(url: "${openWeatherMapURL}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    return await networkHelper.getData();
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
