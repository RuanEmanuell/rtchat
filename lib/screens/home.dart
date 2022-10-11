import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "dart:async";

import "../main.dart";
import "../widgets/widgets.dart";

class HomeScreen extends StatefulWidget{

  final VoidCallback loginScreenAction;

  HomeScreen({
    required this.loginScreenAction,
  });

  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

    bool loading=false;

    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    final formKey=GlobalKey<FormState>();

    Future createAccountAction() async{

      final isValid=formKey.currentState!.validate();

      if(isValid){
      
      
      try{
        
      setState((){
        loading=true;
      });

        FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:emailController.text.trim(),
        password:passwordController.text.trim(),
      );

        Future.delayed(Duration(seconds: 1), (){
         setState((){
          loading=false;
        });         
        });

      } on FirebaseAuthException catch(e){
        print("cu");
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor:Colors.red,
            content:Text(e.message!)
            )
            );
      }
      }
    }

  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body:Container(
        color:Color.fromARGB(26, 155, 39, 176),
        height:screenHeight,
        width:screenWidth,
        child: Center(
          child:loading ? CircularProgressIndicator(color:Colors.purple) : ListView(
            children: [
              Column(
                children: [
                  Logo(height: screenHeight, width:screenWidth),
                  MainText(text:"Create an Account", fontSize:30),
                  Inputs(
                    formKey:formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    passwordInvisible: true,
                    emailText: "Type an email...",
                    passwordText:"Type an password...",
                    validator:(value) => value!=null && value.length < 6 ?
                     "You need a password with at least 6 characters and a valid email" : null
                  ),
                  MainButton(
                    buttonText: "Create account",
                    buttonAction: createAccountAction,
                  ),
                  SecondaryButton(
                    width:screenWidth,
                    secondaryButtonAction: widget.loginScreenAction,
                    text: "Already have an account?",
                    secondaryText: "Sign in"
                  )
                ],
              )
            ]
          )
        ),
      )
    );
  }
}