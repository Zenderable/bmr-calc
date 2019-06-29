import 'dart:math';
import 'package:check_your_bmr_and_bmi/screens/main_page.dart';

class Calculator {
  Calculator({this.height, this.weight, this.gender, this.age});
  final int height;
  final int weight;
  final int age;
  final gender;
  double _bmi;
  double _bmr;

  String calculateBMR() {
    if (gender == GenderType.male) {
      _bmr = 9.99 * weight + 6.25 * height - 4.92 * age + 5;
      return _bmr.toStringAsFixed(0);
    } else {
      _bmr = 9.99 * weight + 6.25 * height - 4.92 * age - 161;
      return _bmr.toStringAsFixed(0);
    }
  }

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.0) {
      return 'Normal';
    } else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'Your bmi score is to low. You should eat more!';
    } else if (_bmi >= 25.0) {
      return 'You bmi score is to high. Try to exercise more.';
    } else
      return 'Good job! You have a normal body weight.';
  }
}
