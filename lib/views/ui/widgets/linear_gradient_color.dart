// this use to add gradient for chart
import 'package:flutter/material.dart';

LinearGradient linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 0, 60, 255).withOpacity(0.7),
    // const Color(0xff477BFF).withOpacity(0.6),
    Colors.white.withOpacity(0.3),
    Colors.white.withOpacity(0.0),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
