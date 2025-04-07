import 'package:weather_app/models/weather_modle.dart';

class WeatherState {
  get weatherModel => null;
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);

 
}

class WeatherFailureState extends WeatherState {}
