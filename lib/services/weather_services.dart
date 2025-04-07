import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_modle.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String CityName}) async {
    if (CityName.isEmpty) {
      throw Exception("Please enter a valid city name.");
    }

    try {
      Response response = await dio.get(
          "http://api.weatherapi.com/v1/forecast.json?key=f783f31afd834bbab40222455250104&q=$CityName&days=1");

      return WeatherModel.fromJson(response.data);
    } catch (_) {
      throw Exception("Something went wrong");
    }
  }
} 