import 'package:flutter/material.dart';
import 'package:check_your_bmr_and_bmi/screens/main_page.dart';

void main() => runApp(CheckYourBMR());

class CheckYourBMR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFF1F1F1),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: Home(), //MainPage
    );
  }
}
