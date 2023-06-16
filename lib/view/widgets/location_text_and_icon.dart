import 'package:admin/view/widgets/large_text.dart';
import 'package:flutter/material.dart';

class LocationTextAndIcon extends StatelessWidget {
  double? custom;
  Function() onPressed;
  LocationTextAndIcon(
      {super.key, required this.size, required this.onPressed, this.custom});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        // color: Colors.black,
        width: custom ?? size.width / 1.5,
        height: size.height / 18,
        child: Row(
          children: [
            SizedBox(
              height: size.height / 16,
              width: size.width / 16,
              child: const Align(
                alignment: Alignment.topLeft,
                child: Image(image: AssetImage("lib/assests/locationn.png")),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LargeText(
                  text: "Nettoor",
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
                LargeText(
                  text: "Maradu,Ernakulam",
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
