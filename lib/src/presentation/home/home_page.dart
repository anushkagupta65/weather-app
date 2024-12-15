import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lisbon/src/application/weather_cubit/weather_cubit.dart';
import 'package:lisbon/src/presentation/home/home_widegts/text_bar.dart';
import 'package:lisbon/src/presentation/home/home_widegts/weather_display.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextBar(
              controller: cityname,
              onSearch: (city) {
                context.read<WeatherCubit>().fetchWeather(city);
              },
            ),
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              } else if (state.weatherModel.isNotEmpty) {
                return WeatherDisplay(weatherModel: state.weatherModel.first);
              } else {
                return const Text("Please enter a valid city!");
              }
            }),
          ],
        ),
      ),
    );
  }
}
