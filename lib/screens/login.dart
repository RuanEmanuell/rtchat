import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "../widgets/widgets.dart";


class LoginScreen extends StatefulWidget{

  final VoidCallback homeScreenAction;

  LoginScreen({
    required this.homeScreenAction,
  });

  @override
  _LoginScreen createState()=> _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{

    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

    Future loginAction() async{
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email:emailController.text.trim(),
        password:passwordController.text.trim(),
      );
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
              MainText(text:"Welcome back!"),
              Inputs(
                emailController: emailController,
                passwordController: passwordController,
                emailText: "Type your email...",
                passwordText:"Type your password...",
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
                secondaryButtonAction: widget.homeScreenAction,
                text: "Don't have an account?",
                secondaryText: "Register"
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