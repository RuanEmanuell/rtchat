import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:firebase_auth/firebase_auth.dart';

import "screens/home.dart";
import "screens/login.dart";
import "screens/auth.dart";
import "screens/forgot.dart";
import "screens/chat.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(initialRoute: "/main", routes: {
    "/main": (context) => const MainScreen(),
    "/home": (context) => HomeScreen(loginScreenAction: () {}),
    "/login": (context) => LoginScreen(homeScreenAction: () {}),
    "/auth": (context) => AuthScreen(),
    "/forgot": (context) => const ForgotPasswordScreen(),
    "/chat": (context) => const ChatScreen(),
  }));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const ChatScreen();
        } else if (snapshot.hasError) {
          return const Center(child: Text("Something gone wrong"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return AuthScreen();
        }
      },
    ));
  }
}
