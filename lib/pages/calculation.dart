import 'dart:math';

import 'dart:math';

class BmiCalculation {
  BmiCalculation({required this.height, required this.weight});
  final double height;
  final int weight;
  late double _result;
  String bmical() {
    _result = weight / pow(height / 100, 2);
    // return _result.toStringAsFixed(1);
    return _result.toStringAsFixed(1);
  }

  String mess() {
    if (_result > 24.9) {
      return " Over Weight";
    } else if (_result < 18.5) {
      return "Under Weight";
    } else {
      return "Normal Weight";
    }
  }
}
