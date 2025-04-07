import 'package:flutter_bloc/flutter_bloc.dart'; // استيراد FlutterBloc
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_state.dart';
import 'package:weather_app/widgets/weather_repository.dart'; // تأكد من المسار الصحيح للـ WeatherRepository

// تعريف الـ Cubit الخاص بـ GetWeather
class GetWeatherCubits extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  // Constructor
  GetWeatherCubits({required this.weatherRepository}) : super(WeatherInitial());

  // دالة لجلب الطقس
  Future<void> getWeather({required String cityName}) async {
    try {
      emit(WeatherLoading()); // عند بداية التحميل
      final weatherData = await weatherRepository
          .getWeatherData(cityName); // استدعاء الـ Repository لجلب بيانات الطقس
      emit(WeatherLoaded(weatherModel: weatherData)); // عند نجاح التحميل
    } catch (e) {
      emit(WeatherError(message: e.toString())); // في حالة حدوث خطأ
    }
  }
}
