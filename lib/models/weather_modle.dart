import 'package:flutter/material.dart';
import 'theme.dart'; // هنا هتستورد ملف الـ theme

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubits(),
      child: BlocBuilder<GetWeatherCubits, WeatherState>(
        builder: (context, state) {
          MaterialColor themeColor = Colors.amber;

          if (state is WeatherLoaded) {
            final condition = state.weatherModel.weatherCondition;
            themeColor = getThemeColor(condition); // استخدام الدالة هنا
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
