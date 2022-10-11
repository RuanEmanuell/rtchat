import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/loginwidgets.dart';


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
      
      try{
        
      setState((){
        loading=true;
      });

        await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:emailController.text.trim(),
        password:passwordController.text.trim(),
      );

        Future.delayed(Duration(seconds: 1), (){
         setState((){
          loading=false;
        });         
        });


      } on FirebaseAuthException catch(e){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor:Colors.red,
            content:Text(e.message=="Given String is empty or null" ? 
            "One or more fields are empty" : e.message!)
            )
            );
       setState((){
          loading=false;
        });    
      
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
            Stack(
              children:[
                Column(
                children: [
                  Logo(height: screenHeight, width:screenWidth),
                  MainText(text:"Welcome back!", fontSize:30),
                  Inputs(
                    emailController: emailController,
                    passwordController: passwordController,
                    passwordInvisible: true,
                    emailText: "Type your email...",
                    passwordText:"Type your password..."
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
              ),
              IconButton(
                onPressed:widget.homeScreenAction,
                icon:Icon(Icons.arrow_back, size:50, color:Colors.purple)
              )
              ]
            )
          ]
            )
        ),
      )
    );
  }
}