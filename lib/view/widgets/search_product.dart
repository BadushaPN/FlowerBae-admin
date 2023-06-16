// import 'dart:async';

import 'package:admin/utils/color.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatelessWidget {
  Function(String?) onChange;
  SearchProduct(
      {super.key,
      required this.size,
      required this.textEditingController,
      required this.onChange});

  final Size size;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width / 7.8,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: textEditingController,
        onChanged: onChange,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.only(bottom: 7),
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          suffixIcon: GestureDetector(
            onDoubleTap: () => Navigator.pop(context),
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: dark,
              ),
              onPressed: () {
                textEditingController.clear();
              },
            ),
          ),
          hintText: 'Search product',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
