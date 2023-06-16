import 'package:admin/utils/color.dart';
import 'package:admin/view/login_screen/login_screen.dart';
import 'package:admin/view/widgets/back_button.dart';
import 'package:admin/view/widgets/large_text.dart';
import 'package:flutter/material.dart';

import '../user_details_screen/user_details_screen.dart';
import 'widgets/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 15,
            ),
            MyBackButton(
              onpressed: () {
                Navigator.pop(context);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LargeText(
                  text: "User Name",
                  fontSize: 30,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w400,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("lib/assests/user.png"),
                ),
              ],
            ),
            SizedBox(
              height: size.width / 15,
            ),
            // ProfileLists(
            //   size: size,
            //   onTap: () {
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) => YourOrders()));
            //   },
            //   text: 'Your oders',
            // ),
            ProfileLists(
              size: size,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfileScreen()));
              },
              text: 'Account',
            ),
            ProfileLists(
              size: size,
              onTap: () {},
              text: 'Privacy and policy',
            ),
            ProfileLists(
              size: size,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              text: 'Logout',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: LargeText(
                text: "FlowerBae",
                color: dark,
              ),
            )
          ],
        ),
      )),
    );
  }
}
