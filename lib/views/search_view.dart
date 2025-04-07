import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // تعيين لون خلفية الـ AppBar إلى الأزرق
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Search City'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              // التأكد من استدعاء الـ Cubit لتحميل البيانات
              var getWeatherCubit = BlocProvider.of<GetWeatherCubits>(context);
              getWeatherCubit.getWeather(
                  cityName:
                      value); // التأكد من أن getWeather يتعامل مع cityName
              Navigator.pop(context); // إغلاق شاشة البحث بعد إدخال المدينة
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              labelText: "Search City",
              hintText: "Enter City name ",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
