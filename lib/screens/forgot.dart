import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget{
  @override
  _ForgotPasswordScreen createState()=> _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen>{

  TextEditingController emailController=TextEditingController();

  Future resetPassword() async{
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:Colors.purple,     
        content:Text("Email sent, remember to check your spam box")
      )
    );
    Future.delayed(Duration(seconds: 1), (){
      Navigator.pop(context);
    });
    }on FirebaseAuthException catch(e){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor:Colors.red,
            content:Text("This email is invalid or not registered")
            )
            );   
    }
  }

  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        elevation:0,
        backgroundColor: Color.fromARGB(26, 155, 39, 176),
        leading:IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back, color:Colors.purple, size:50)
        )
      ),
      body: Center(
        child: Container(
          width:screenWidth,
          height:screenHeight,
          color:Color.fromARGB(26, 155, 39, 176),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              MainText(
                text:"Receive an email to reset password",
                fontSize:20
              ),
              Container(
                margin:EdgeInsets.all(20),
                child: TextFormField(
                  style:TextStyle(
                    color:Color.fromARGB(255, 238, 54, 177),
                  ),
                  controller:emailController,
                  decoration:InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                  borderSide:BorderSide(color: Colors.purple)
                  ),
                  focusedBorder:UnderlineInputBorder(
                  borderSide:BorderSide(color: Colors.purple)
                  ),   
                  hintStyle:TextStyle(
                  color:Colors.purple
                  ),
                  hintText: "Type your email...",
                  prefixIcon: Container(
                   margin:EdgeInsets.only(right: 10),
                   child: Icon(Icons.email, color:Colors.purple)
                   )              
                  )
                ),
              ),
              ElevatedButton(
                onPressed:(){
                  resetPassword();
                },
                style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.purple
                ),
                child:Container(
                  width:150,
                  height:50,
                  child: Row(
                    children:[
                      Icon(Icons.lock_reset),
                      Container(width: 15),
                      Text("Reset password")
                    ]   
                  )
                )
              )
            ]
          )
        ),
      ),
    );
  }
}