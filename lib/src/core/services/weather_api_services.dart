import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lisbon/src/data/models/weather_model/weather_model.dart';

class APIWeatherService {
  Future<WeatherModel> weatherData(String cityName) async {
    String appid = "0e6be03729b6e0a2a4318d6a65678c3b";

    try {
      final url =
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appid&units=metric";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return WeatherModel.fromJson(_parseWeatherData(jsonData));
      } else {
        throw Exception(
            'Failed to load weather data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
      throw Exception('Failed to fetch weather data');
    }
  }

  Map<String, dynamic> _parseWeatherData(Map<String, dynamic> json) {
    return {
      'cityName': json['name'],
      'description': json['weather'][0]['description'],
      'icon': json['weather'][0]['icon'],
      'temp': json['main']['temp'],
      'pressure': json['main']['pressure'],
      'humidity': json['main']['humidity'],
      'windSpeed': json['wind']['speed'],
      'hTemp': json['main']['temp_max'],
      'lTemp': json['main']['temp_min'],
    };
  }
}
