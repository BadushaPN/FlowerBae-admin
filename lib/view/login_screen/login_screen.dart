import 'package:admin/view/home_page/home_page_sceen.dart';
import 'package:admin/view/widgets/back_button.dart';
import 'package:admin/view/widgets/large_text.dart';
import 'package:admin/view/widgets/text_buttons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/my_textformfields.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  void _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  void _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setBool('rememberMe', _rememberMe);
    // ignore: use_build_context_synchronously
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomePag()),
        (Route<dynamic> route) => false);
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username == 'username' && password == 'password') {
      _saveCredentials();
    }
    // Perform login validation here

    // Save login credentials if "Remember Me" is checked
    // if (_rememberMe) {
    //   _saveCredentials();
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: size.width / 3,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Login",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextformFields(
                controller: _usernameController,
                hintText: "User Name",
                line: 1,
              ),
              MyTextformFields(
                controller: _passwordController,
                hintText: "Password",
                line: 1,
              ),
              // SizedBox(
              //   height: size.height / 15,
              // ),
              TextButtons(
                size: size,
                text: "Login",
                onPressed: () {
                  _login();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: LargeText(text: "FlowerBae"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
