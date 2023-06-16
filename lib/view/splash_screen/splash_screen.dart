import 'package:admin/utils/color.dart';
import 'package:admin/view/home_page/home_page_sceen.dart';
import 'package:admin/view/login_screen/login_screen.dart';
import 'package:admin/view/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUSerLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('lib/assests/55517-yoga-lotus-flower.json'),
        backgroundColor: dark,
        duration: 3200,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 250,
        nextScreen: widget);
  }

  checkUSerLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    final _userName = pref.getString('userName');
    final _passWord = pref.getString('password');
    // ignore: unrelated_type_equality_checks
    if (_userName == 'username' || _passWord == 'password') {
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx1) {
        return BottomNavigatoionBar();
      }));
    } else {
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (cotx1) {
        return LoginPage();
      }));
    }
  }
}
