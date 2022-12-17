import 'dart:math';

import 'package:flutter/material.dart';

class BmiCalculation {
  BmiCalculation({required this.height, required this.weight});
  final double height;
  final int weight;
  late double _result;
  late double ref1;
  late double ref2;
  String bmical() {
    _result = weight / pow(height / 100, 2);
    // return _result.toStringAsFixed(1);
    return _result.toStringAsFixed(1);
  }

  Widget mess() {
    if (_result > 24.9) {
      return const Text(
        "Over Weight",
        style: TextStyle(color: Colors.pinkAccent, fontSize: 28),
      );
      //return " Over Weight";
    } else if (_result < 18.5) {
      return const Text(
        "Under Weight",
        style: TextStyle(color: Colors.pinkAccent, fontSize: 28),
      );
    } else {
      return const Text(
        "Normal Weight",
        style: TextStyle(color: Colors.greenAccent, fontSize: 28),
      );
    }
  }

  String recomandation() {
    ref1 = pow(height / 100, 2) * 18.4;
    ref2 = pow(height / 100, 2) * 25;
    ref1.round();
    return "${ref1.round()} - ${ref2.round()} Kg";
  }
}
