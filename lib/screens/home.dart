import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
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
                  margin:EdgeInsets.all(25),
                  height:screenHeight/3.5,
                  child:Image.asset("assets/images/rtchat.png")
                ),
                Container(
                  margin:EdgeInsets.only(bottom:40),
                  child: Text("Create an account", style:GoogleFonts.secularOne(
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
                      hintText:"Type an email...",
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
                  margin:EdgeInsets.only(
                    top:20,
                    bottom:20
                  ),
                  child:ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple
                    ),
                    onPressed:(){
        
                    },
                    child:const Text("Create account")
                  )
                ),
                TextButton(
                  onPressed:(){

                  },
                  child:Container(
                    width:screenWidth/1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already has an account?", style:TextStyle(
                          color:Colors.purple,
                        )),
                        SizedBox(width:10),
                        Text("Sign in", style:TextStyle(
                          color:Color.fromARGB(255, 238, 54, 177),
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