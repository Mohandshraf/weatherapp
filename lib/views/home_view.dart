import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Weather App ',
          ),
        ),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Search();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubits, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) { // استخدم WeatherInitial بدلاً من WeatherInitialState
            return const NoWeatherBody();
          } else if (state is WeatherLoaded) { // استخدم WeatherLoaded بدلاً من WeatherLoadedState
            return WeatherInfoBody(weatherModel: state.weatherModel); // استخدم state بدلاً من State
          } else {
            return const Text("oops there was an error");
          }
        },
      ),
    );
  }
}
