import 'package:flutter/material.dart';
import 'package:mis_lab1/screens/exam_details.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      initialRoute: "/",
      routes:{
        "/": (context) => const HomeScreen(),
        "/details": (context) => const ExamDetails(),
      }
    );
  }
}