import 'package:weather_app/models/weather_modle.dart'; // استيراد موديل البيانات

class WeatherRepository {
  Future<WeatherModel> getWeatherData(String cityName) async {
    // هنا يمكنك إضافة الكود الذي يستدعي الـ API أو أي مصدر آخر للحصول على بيانات الطقس
    // على سبيل المثال، استرجاع بيانات ثابتة أو استخدام أي API خدمة للطقس.
    
    // في هذا المثال، سنقوم بإرجاع بيانات ثابتة:
    return WeatherModel(
      cityName: cityName,
      date: '2023-04-07',
      temp: 25.0,
      maxTemp: 30.0,
      minTemp: 20.0,
      weatherCondition: 'Sunny',
    );
  }
}
