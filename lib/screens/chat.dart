import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget{

  @override
  _ChatScreen createState()=> _ChatScreen();

}

class _ChatScreen extends State<ChatScreen>{

 final user=FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context){
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          height:120,
          color: Colors.purple,
          child:Row(
            children: [
              Expanded(
                child: Container(
                  margin:EdgeInsets.only(top: statusBarHeight, left:20),   
                  child: Text("RTChat", style:GoogleFonts.rubik(
                  textStyle:TextStyle(
                    fontSize:30,
                    color:Colors.white
                  )
                 )),
                ),
              ),
              Expanded(
                child: Container(
                  margin:EdgeInsets.only(left: screenWidth/5, top:20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed:(){

                        },
                        icon:Icon(Icons.search, size:40, color:Colors.white)
                      ),
                      IconButton(
                        onPressed:(){
                          FirebaseAuth.instance.signOut();
                        },
                        icon:Icon(Icons.exit_to_app, size:40, color:Colors.white)    
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        )
      ),
      body: ListView(
        children:[
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            for(var i=0; i<10; i++)
            Container(
              margin:EdgeInsets.all(20),
              child: Text(user.email!, style:TextStyle(
                fontSize:20
              ))
            )
          ],
        )
        ]
      ),
    );
  }
}