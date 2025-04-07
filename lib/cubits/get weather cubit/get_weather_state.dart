import 'package:weather_app/models/weather_modle.dart';

// تعريف الحالات المختلفة لـ Cubit
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}
