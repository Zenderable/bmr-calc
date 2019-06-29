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
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: action,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
