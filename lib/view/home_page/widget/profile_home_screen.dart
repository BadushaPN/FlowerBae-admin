import 'package:flutter/material.dart';

class ProfileHomeScreen extends StatelessWidget {
  Function() onTap;
  ProfileHomeScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CircleAvatar(
        backgroundImage: AssetImage("lib/assests/user.png"),
      ),
    );
  }
}
