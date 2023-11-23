import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonMultiEffect extends StatelessWidget {
  const ButtonMultiEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326,
      height: 90,
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 52,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
