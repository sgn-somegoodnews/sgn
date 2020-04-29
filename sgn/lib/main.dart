import 'package:flutter/material.dart';
import 'package:sgn/screens/home_screen/home_screen.dart';


void main() {
  runApp(SgnApp());
}

class SgnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );

  }
}

