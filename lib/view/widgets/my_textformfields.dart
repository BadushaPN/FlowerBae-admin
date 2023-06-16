import 'package:admin/utils/color.dart';
import 'package:flutter/material.dart';

class MyTextformFields extends StatelessWidget {
  double? padding;

  TextEditingController controller;
  String hintText;
  MyTextformFields(
      {super.key,
      required this.controller,
      required this.hintText,
      this.padding,
      required int line});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 20, left: 20, right: 20, bottom: padding ?? 20),
      child: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        // color: Colors.white,
        height: 50,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
