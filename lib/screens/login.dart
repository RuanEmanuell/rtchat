import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import "home.dart";


class LoginScreen extends StatefulWidget{
  @override
  _LoginScreen createState()=> _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{
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
                Container(
                  margin:EdgeInsets.all(15),
                  height:screenHeight/3.5,
                  child:Image.asset("assets/images/rtchat.png")
                ),
                Container(
                  margin:EdgeInsets.only(bottom:30),
                  child: Text("Welcome back!", style:GoogleFonts.secularOne(
                    fontSize: 30,
                    color: Colors.purple
                  ))
                ),
                Container(
                  margin:EdgeInsets.only(
                    right:20,
                    left:20,
                    bottom:10),
                  child:TextFormField(
                    style:TextStyle(
                      color:Color.fromARGB(255, 238, 54, 177),
                    ),
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
                      hintText:"Type your email...",
                      prefixIcon: Container(
                        margin:EdgeInsets.only(right: 10),
                        child: Icon(Icons.email, color:Colors.purple)
                      )
                    )
                  )
                ),
                Container(
                  margin:EdgeInsets.only(
                    right:20,
                    left:20),
                  child:TextFormField(
                    style:TextStyle(
                      color:Color.fromARGB(255, 238, 54, 177),
                    ),
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
                      hintText:"Type your password...",
                      prefixIcon: Container(
                        margin:EdgeInsets.only(right: 10),
                        child: Icon(Icons.lock, color:Colors.purple)
                      )
                    )
                  )
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
                Container(
                  margin:EdgeInsets.only(
                    top:10
                  ),
                  child:ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple
                    ),
                    onPressed:(){
        
                    },
                    child:const Text("Log in")
                  )
                ),
                TextButton(
                  onPressed:(){
                  Navigator.pushNamed(context, "/home");
                  },
                  child:Container(
                    margin:EdgeInsets.only(top:10),
                    width:screenWidth/1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style:TextStyle(
                          color:Colors.purple
                        )),
                        Container(width:10),
                        Text("Register", style:TextStyle(
                          color:Color.fromARGB(255, 238, 54, 177)
                        ))
                        
                      ],
                    ),
                  )
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