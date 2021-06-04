import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final hoursInChinese = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12'
];

final minutesInChinese = [
  '0',
  '|',
  '10',
  '|',
  '20',
  '|',
  '30',
  '|',
  '40',
  '|',
  '50',
  '|'
];
final weekdayList = ['Mon', 'Tues', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
final monthList = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

enum theme {
  lightTheme,
  darkTheme,
  numbers,
  indicatorColor,
  shadow,
}

final taichiTheme = {
  theme.lightTheme: Color.fromARGB(255, 14, 88, 142),
  theme.darkTheme: Color.fromARGB(255, 215, 235, 252),
  theme.numbers: Color.fromARGB(255, 210, 235, 254),
  theme.indicatorColor: Color.fromARGB(255, 252, 154, 48),
  theme.shadow: Color.fromARGB(255, 59, 109, 154),
};

final radiansPerTick = radians(360 / 60);

final radiansPerHour = radians(360 / 24);
