import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_default/screens/home.dart';

import "home.dart";
import "login.dart";

class AuthScreen extends StatefulWidget{
  @override
  _AuthScreen createState()=> _AuthScreen();
}

class _AuthScreen extends State<AuthScreen>{
  bool isLogin=false;
  @override
  Widget build(BuildContext context)=> isLogin ? LoginScreen(
    homeScreenAction:toggle ) : HomeScreen( loginScreenAction:toggle);

  void toggle(){
    setState((){
      isLogin=!isLogin;
    });
  }
}