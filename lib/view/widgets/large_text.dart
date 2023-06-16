import 'package:admin/utils/color.dart';
import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  FontWeight? fontWeight;
  double? letterSpacing;
  double? fontSize;
  String text;
  Color? color;

  LargeText(
      {required this.text,
      super.key,
      this.fontSize,
      this.letterSpacing,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize ?? 50,
          color: color ?? iconColor,
          fontWeight: fontWeight ?? FontWeight.bold,
          letterSpacing: letterSpacing ?? -3,
        ));
  }
}
