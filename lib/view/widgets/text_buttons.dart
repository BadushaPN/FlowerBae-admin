import 'package:admin/utils/color.dart';
import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  double? padding;
  String text;
  double? fontSize;
  Function() onPressed;
  TextButtons(
      {super.key,
      required this.size,
      required this.onPressed,
      required this.text,
      this.fontSize,
      this.padding});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: padding ?? 20,
          right: padding ?? 20,
          top: padding ?? 20,
          bottom: padding ?? 30),
      child: Container(
        width: size.width,
        height: size.height / 14.5,
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(60),
        ),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  color: white,
                  fontSize: fontSize ?? 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1),
            )),
      ),
    );
  }
}
