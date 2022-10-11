import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget{
  @override
  _ChatScreen createState()=> _ChatScreen();
}

class _ChatScreen extends State<ChatScreen>{

  @override
  Widget build(BuildContext context){
    final user=FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Signed in as"),
            Text(user.email!),
            Container(
              margin:EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed:(){
                  FirebaseAuth.instance.signOut();
                },
                child:SizedBox(
                  width:100,
                  height:50,
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, size:40),
                      Text("Sign out"),
                    ],
                  ),
                )
              ),
            )
          ],
        )
      ),
    );
  }
}