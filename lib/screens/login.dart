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

    bool loading=false;

    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

    final formKey=GlobalKey<FormState>();


   Future loginAction() async{

    
      final isValid=formKey.currentState!.validate();

      if(isValid){
      setState((){
        loading=true;
      });

      try{

        FirebaseAuth.instance.signInWithEmailAndPassword(
        email:emailController.text.trim(),
        password:passwordController.text.trim(),
      );

        Future.delayed(Duration(seconds: 1), (){
         setState((){
          loading=false;
        });         
        });
        }on FirebaseAuthException catch(e){
          print(e);
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
                MainText(text:"Welcome back!", fontSize:30),
                Inputs(
                  emailController: emailController,
                  passwordController: passwordController,
                  passwordInvisible: true,
                  emailText: "Type your email...",
                  passwordText:"Type your password...",
                  validator:(value) => value!=null && value.length < 6 ?
                  "You need a password with at least 6 characters and a valid email" : null
                ),
                 Container(
                  margin:EdgeInsets.only(left: 200),
                  child:TextButton(
                    onPressed:(){
                      Navigator.pushNamed(context, "/forgot");
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
            )
          ]
            )
        ),
      )
    );
  }
}