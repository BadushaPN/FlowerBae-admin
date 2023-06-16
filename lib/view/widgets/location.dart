import 'package:admin/view/widgets/large_text.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: size.width / 3,
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
