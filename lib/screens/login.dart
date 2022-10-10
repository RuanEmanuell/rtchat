import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import "../widgets/widgets.dart";
import "home.dart";

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreen createState()=> _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{
  void loginAction(){

  }

  void homeScreenAction(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body:Center(
        child:Stack(
          children:[
            ListView(
            children: [
              Container(
              color:Color.fromARGB(26, 155, 39, 176),
              height:screenHeight,
              width:screenWidth,
              child: Column(
                children: [
                  Logo(height: screenHeight, width:screenWidth),
                  MainText(text:"Welcome back!"),
                  Inputs(
                    emailText: "Type your email...",
                    passwordText:"Type your password..."
                  ),
                   Container(
                    margin:EdgeInsets.only(left: 200),
                    child:TextButton(
                      onPressed:(){
        
                      },
                      child:Text("Forgot your password?", style:TextStyle(
                        color:Colors.deepPurple
                      ))
                    )
                  ),
                  MainButton(
                    buttonText: "Log in",
                    buttonAction: loginAction,
                  ),
                  SecondaryButton(
                    width:screenWidth,
                    secondaryButtonAction: homeScreenAction,
                    text: "Don't have an account?",
                    secondaryText: "Register"
                  )
                ],
              ),
            )
            ]
          ),
          SafeArea(
            child: IconButton(
            onPressed:(){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back, size:40, color:Colors.purple)
                  ),
          )
          ]
        )
      )
    );
  }
}