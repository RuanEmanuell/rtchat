import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:firebase_auth/firebase_auth.dart';

import "screens/home.dart";
import "screens/login.dart";
import "screens/chat.dart";
import "screens/auth.dart";


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute:"/main",
    routes:{
      "/main":(context)=>MainScreen(),
      "/home":(context)=>HomeScreen(loginScreenAction: () {  },),
      "/login":(context)=>LoginScreen(homeScreenAction: () {  },),
      "/chat":(context) => ChatScreen(),
      "/auth":(context)=>AuthScreen()
    }
    
  ));


}


class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return ChatScreen();
          }else{
            return AuthScreen();
          }
        },
      )
    );
  }
}
