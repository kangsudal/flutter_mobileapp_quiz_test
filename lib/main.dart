import 'package:flutter/material.dart';
import 'package:quizz_app/screen/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Quizz App',
      home: HomeScreen(),
    );
  }
}

