import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lisbon/src/application/weather_cubit/weather_cubit.dart';
import 'package:lisbon/src/core/services/weather_api_services.dart';
import 'package:lisbon/src/presentation/home/home_page.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 58, 74, 129),
  ),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(APIWeatherService()),
        ),
      ],
      child: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        return ScreenUtilInit(
          designSize: Size(1440, 920),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              title: 'Weather App',
              home: HomePage(),
            );
          },
        );
      }),
    );
  }
}
