import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool value;
  final Function () onValueChange;
  const CustomSwitchButton({required this.value,required this.onValueChange ,super.key});

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      height: 32,
      width: 60,
      decoration: ShapeDecoration(
          color: Color(0xFF109F9A),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
      child: (widget.value)?Row(
        children: [

          GestureDetector(
              onTap: () {
                widget.onValueChange.call();
              },
              child: Container(
                padding: EdgeInsets.all(2),
                height: 28,
                width: 28,
                decoration:
                    ShapeDecoration(shape: CircleBorder(), color: Theme.of(context).primaryColor),
                child: SvgPicture.asset("assets/icons/ic_moon.svg"),
              ))

        ],
      ):Row(
        children: [

          Spacer(),
          GestureDetector(
              onTap: () {
                widget.onValueChange.call();
              },
              child: Container(
                padding: EdgeInsets.all(2),
                height: 28,
                width: 28,
                decoration:
                ShapeDecoration(shape: CircleBorder(), color: Theme.of(context).primaryColor),
                child: SvgPicture.asset("assets/icons/ic_moon.svg"),
              ))

        ],
      ),
    );
  }
}
