import 'package:climate_check/location.dart';
import 'package:climate_check/networking.dart';

const apiKey = '9f97f6aac47023a02ead07c5ab5b39a6';
const weatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
double latitude;
double longitude;

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    var url = '$weatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {

    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&appid=9f97f6aac47023a02ead07c5ab5b39a6');

    var weatherData = await networkHelper.getData();

    return weatherData;


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
