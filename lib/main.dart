import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'firebase_options.dart';


import "screens/home.dart";


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute:"/home",
    routes:{
      "/home":(context)=>HomeScreen()
    }
  ));
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

   var collection2=FirebaseFirestore.instance.collection("pinto");

  collection2.doc().set(
    {
      "pinto":"penis"
    }
  );


}

