import 'package:flutter/material.dart';
import 'package:check_your_bmr_and_bmi/constants.dart';
import 'package:check_your_bmr_and_bmi/components/background_card.dart';

class Button extends StatelessWidget {
  Button({this.text, this.onTap, this.color, this.edges});
  final Color color;
  final Text text;
  final Function onTap;
  final EdgeInsetsGeometry edges;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: edges,
        width: double.infinity,
        child: BackgroundCard(
          color: kBottomButtonColor,
          childContainer: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.action, this.color});
  final IconData icon;
  final Function action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        elevation: 5,
        color: color, // button color
        child: InkWell(
            splashColor: Color(0xFFF1008F), // inkwell color
            child: SizedBox(width: 50, height: 50, child: Icon(icon)),
            //onLongPress: action,
            onTap: action),
      ),
    );
  }
}
