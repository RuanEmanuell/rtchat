import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "dart:async";

import '../widgets/loginwidgets.dart';

//Create account screen
class HomeScreen extends StatefulWidget {
  final VoidCallback loginScreenAction;

  const HomeScreen({
    super.key,
    required this.loginScreenAction,
  });

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool loading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future createAccountAction() async {
    try {
      setState(() {
        loading = true;
      });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          loading = false;
        });
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.message == "Given String is empty or null"
              ? "One or more fields are empty"
              : e.message!)));
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(26, 155, 39, 176),
      height: screenHeight,
      width: screenWidth,
      child: Center(
          child: loading
              ? const CircularProgressIndicator(color: Colors.purple)
              : ListView(children: [
                  Column(
                    children: [
                      Logo(height: screenHeight, width: screenWidth),
                      MainText(text: "Create an Account", fontSize: 30),
                      Inputs(
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        passwordInvisible: true,
                        emailText: "Type an email...",
                        passwordText: "Type an password...",
                      ),
                      MainButton(
                        buttonText: "Create account",
                        buttonAction: createAccountAction,
                      ),
                      SecondaryButton(
                          width: screenWidth,
                          secondaryButtonAction: widget.loginScreenAction,
                          text: "Already have an account?",
                          secondaryText: "Sign in")
                    ],
                  )
                ])),
    ));
  }
}
