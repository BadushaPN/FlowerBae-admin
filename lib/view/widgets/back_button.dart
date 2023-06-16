import 'package:admin/utils/color.dart';
import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  Function() onpressed;
  MyBackButton({
    required this.onpressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "<",
          style: TextStyle(
              fontSize: 40, color: iconColor, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
