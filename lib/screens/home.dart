import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "dart:async";

import "../main.dart";
import "../widgets/widgets.dart";

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

    Future createAccountAction() async{
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:emailController.text.trim(),
        password:passwordController.text.trim(),
      );
    }

    void loginScreenAction(){
      Navigator.pushNamed(context, "/login");
    }

  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body:Center(
        child:ListView(
          children: [
            Container(
            color:Color.fromARGB(26, 155, 39, 176),
            height:screenHeight,
            width:screenWidth,
            child: Column(
              children: [
                Logo(height: screenHeight, width:screenWidth),
                MainText(text:"Create an Account"),
                Inputs(
                  emailController: emailController,
                  passwordController: passwordController,
                  emailText: "Type an email...",
                  passwordText:"Type an password..."
                ),
                MainButton(
                  buttonText: "Create account",
                  buttonAction: createAccountAction,
                ),
                SecondaryButton(
                  width:screenWidth,
                  secondaryButtonAction: loginScreenAction,
                  text: "Already have an account?",
                  secondaryText: "Sign in"
                )
              ],
            ),
          )
          ]
        )
      )
    );
  }
}