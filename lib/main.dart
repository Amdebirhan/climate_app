import 'package:climate_app/screens/loading_screen.dart';
import 'package:climate_app/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21)

      ),
      home: LoadingScreen(),
    );
  }
}
