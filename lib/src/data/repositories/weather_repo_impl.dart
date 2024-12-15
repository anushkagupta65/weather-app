// import 'package:lisbon/src/core/services/weather_api_services.dart';
// import 'package:lisbon/src/data/models/weather_model/weather_model.dart';

// class WeatherRepositoryImpl {
//   final APIWeatherService _apiWeatherService = APIWeatherService();

//   Future<WeatherModel> getCurrentWeather(String cityName) async {
//     try {
//       final responseData = await _apiWeatherService.weatherData(cityName);

//       final weatherModel = WeatherModel(
//         cityName: responseData['name'],
//         description: responseData['weather'][0]['description'],
//         icon: responseData['weather'][0]['icon'],
//         temp: responseData['main']['temp'],
//         pressure: responseData['main']['pressure'],
//         humidity: responseData['main']['humidity'],
//         windSpeed: responseData['wind']['speed'],
//       );
//       return weatherModel;
//     } catch (e) {
//       print('Error fetching weather data: $e');
//       throw Exception('Failed to fetch weather data');
//     }
//   }
// }
