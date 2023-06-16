import 'package:admin/view/widgets/large_text.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LargeText(
      text: "Hi,Badusha",
      fontSize: 20,
      letterSpacing: 0,
    );
  }
}
