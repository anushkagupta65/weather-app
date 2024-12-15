import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lisbon/src/core/services/weather_api_services.dart';
import 'package:lisbon/src/data/models/weather_model/weather_model.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final APIWeatherService _apiWeatherService;

  WeatherCubit(this._apiWeatherService) : super(WeatherState.initial());

  void updateCityName(String cityName) {
    emit(state.copyWith(cityName: cityName));
  }

  Future<void> fetchWeather(String cityName) async {
    emit(state.copyWith(isLoading: true));

    try {
      final weather = await _apiWeatherService.weatherData(cityName);
      emit(state.copyWith(
        cityName: cityName,
        isLoading: false,
        weatherModel: [weather],
      ));
    } catch (e) {
      print('Error fetching weather data: $e');
      emit(state.copyWith(
        isLoading: false,
        weatherModel: [],
      ));
    }
  }
}
