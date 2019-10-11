import 'package:flutter/material.dart';
import 'package:check_your_bmr_and_bmi/constants.dart';

class GenderIconContent extends StatelessWidget {
  GenderIconContent(
      {@required this.sex, @required this.label, @required this.color});
  final String label;
  final IconData sex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          sex,
          size: 80.0,
          color: color,
        ),
        SizedBox(
          height: 10.0,
          width: 50.0,
          child: Divider(
            color: color,
            height: 16.0,
          ),
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
