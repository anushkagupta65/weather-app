part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  factory WeatherState({
    @Default(false) bool isLoading,
    @Default([]) List<WeatherModel> weatherModel,
    @Default('') String cityName,
  }) = _WeatherState;

  factory WeatherState.initial() => WeatherState(
        isLoading: false,
        weatherModel: [],
        cityName: '',
      );
}
