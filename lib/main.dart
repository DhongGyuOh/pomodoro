import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                backgroundColor: const Color(0xFFE7626C)),
            cardColor: const Color(0xFFF4EDDB),
            focusColor: const Color(0xFF232B55)),
        home: const HomeScreen());
  }
}
