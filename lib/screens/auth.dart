import 'package:flutter/material.dart';
import 'package:flutter_default/screens/home.dart';

import "login.dart";

/*A screen for choosing if it will be displayed the login or create account 
screen, based on the isLogin variable and toggle function
*/


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginScreen(homeScreenAction: toggle) : HomeScreen(loginScreenAction: toggle);

  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
