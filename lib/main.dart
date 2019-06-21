import 'package:flutter/material.dart';
import 'package:check_your_bmr_and_bmi/screens/main_page.dart';

void main() => runApp(CheckYourBMR());

class CheckYourBMR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), //MainPage
    );
  }
}
