import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'parisienne',
            fontSize: 60,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontFamily: 'sunflower',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      home: Home(),
    );
  }
}
