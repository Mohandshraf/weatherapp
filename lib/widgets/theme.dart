// theme.dart
import 'package:flutter/material.dart';

MaterialColor getThemeColor(String condition) {
  if (condition == 'Sunny') {
    return Colors.orange;
  } else if (condition == 'Partly cloudy') {
    return Colors.blueGrey;
  } else if (condition == 'Cloudy' || condition == 'Overcast') {
    return Colors.grey;
  } else if (condition.contains('rain') || condition.contains('Rain')) {
    return Colors.blue;
  } else if (condition.contains('snow') || condition.contains('Snow')) {
    return Colors.lightBlue;
  } else if (condition.contains('thunder') || condition.contains('Thunder')) {
    return Colors.deepPurple;
  } else if (condition.contains('fog') ||
      condition.contains('Fog') ||
      condition.contains('mist') ||
      condition.contains('Mist')) {
    return Colors.brown;
  } else {
    return Colors.amber;
  }
}
