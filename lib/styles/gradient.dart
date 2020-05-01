import 'package:flutter/material.dart';

final orangeToRed = LinearGradient(
    colors: [
      Color(0xFFFF3434),
      Color(0xFFCE00A2)
    ]
);

final transparentToBlack = LinearGradient(
  colors: [Color(0x00000000), Color(0xaa000000),],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter
);


final transparentToBlack2 = LinearGradient(
    colors: [Color(0x11000000), Color(0xEE000000),],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
);