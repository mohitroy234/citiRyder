import 'package:flutter/material.dart';

Gradient background_color=LinearGradient(colors: [
  Colors.blueAccent,
  Colors.blue.shade800,
  Colors.blueGrey.shade900
],
  stops:const [
    0.2,
    0.5,
    1,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter
);

Color back_color=Colors.white;

Gradient background_color1=const LinearGradient(colors: [
  Color(0xff1d4e89),
  Colors.white12,
  Colors.white70
],
    stops:[
      0.5,
      0.7,
      1,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
);