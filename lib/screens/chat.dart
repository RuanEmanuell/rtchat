import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import "../widgets/chatwidgets.dart";

class ChatScreen extends StatefulWidget{

  @override
  _ChatScreen createState()=> _ChatScreen();

}

class _ChatScreen extends State<ChatScreen>{

 final user=FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.purple,
        title:Text("RTChat", style:GoogleFonts.rubik(
          textStyle:TextStyle(
            fontSize:30,
            color:Colors.white
          )
        ))
      ),
      body: Center(
        child:Column(
          children: [ 
          ],
        )
      ),
    );
  }
}