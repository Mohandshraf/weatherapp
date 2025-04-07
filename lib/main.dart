import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/theme.dart';
import 'package:weather_app/widgets/weather_repository.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubits(weatherRepository: WeatherRepository()),
      child: BlocBuilder<GetWeatherCubits, WeatherState>(
        builder: (context, state) {
          MaterialColor themeColor = Colors.amber;

          if (state is WeatherLoaded) {
            final condition = state.weatherModel.weatherCondition;
            themeColor = getThemeColor(condition);
          }

          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeColor,
            ),
            debugShowCheckedModeBanner: false,
            builder: DevicePreview.appBuilder,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
