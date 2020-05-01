import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        width: 80,
        child: AspectRatio(
          aspectRatio: 400 / 141,
          child: Image.asset(
            "assets/ui/logo_outline.png",
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}
