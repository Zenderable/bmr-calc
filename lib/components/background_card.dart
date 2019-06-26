import 'package:flutter/material.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard({@required this.color, this.childContainer, this.gesture});
  final Color color;
  final Widget childContainer;
  final Function gesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gesture,
      child: Container(
        child: childContainer,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
