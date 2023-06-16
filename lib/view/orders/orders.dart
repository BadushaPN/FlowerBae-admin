import 'package:admin/view/widgets/large_text.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 28,
            ),
            LargeText(
              text: "Orders",
              fontSize: 30,
              letterSpacing: -1,
            ),
          ],
        ),
      )),
    );
  }
}
