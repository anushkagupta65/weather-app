import 'package:flutter/material.dart';
import 'package:lisbon/src/data/models/weather_model/weather_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherDisplay({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(
          weatherModel.cityName,
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 56.h),
        Text(
          weatherModel.description,
          style: TextStyle(
            fontSize: 40,
            fontStyle: FontStyle.italic,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 72.h),
        Image.network(
          'https://openweathermap.org/img/wn/${weatherModel.icon}@2x.png',
          height: 112,
          width: 112,
          color: Color(0xFFE0E0E0),
        ),
        SizedBox(height: 72.h),
        Text(
          '${weatherModel.temp}°C',
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'H: ${weatherModel.hTemp}°C',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              'L: ${weatherModel.lTemp}°C',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Text(
          'Pressure: ${weatherModel.pressure} hPa',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white60,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Humidity: ${weatherModel.humidity}%',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white60,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Wind Speed: ${weatherModel.windSpeed} m/s',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}
