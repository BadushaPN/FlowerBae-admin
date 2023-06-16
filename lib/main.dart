import 'package:admin/utils/color.dart';
import 'package:admin/view/login_screen/login_screen.dart';
import 'package:admin/view/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light(primary: myTheme),
          scaffoldBackgroundColor: myTheme),
      title: "FlowerBea",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
