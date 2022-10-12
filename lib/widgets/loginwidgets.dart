import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widgets used on the login and create account screens

class Logo extends StatelessWidget {
  Logo({this.height, this.width});

  var height;
  var width;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50),
        width: width / 1.25,
        height: height / 3.5,
        child: Image.asset("assets/images/rtchat.png"));
  }
}

class MainText extends StatelessWidget {
  MainText({this.text, required this.fontSize});

  var text;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Text(text, style: GoogleFonts.secularOne(fontSize: fontSize, color: Colors.purple)));
  }
}

class Inputs extends StatefulWidget {
  var emailText;
  var passwordText;
  var emailController;
  var passwordController;
  var passwordInvisible;
  var formKey;

  Inputs(
      {this.emailText,
      this.passwordText,
      this.emailController,
      this.passwordController,
      this.passwordInvisible,
      this.formKey});

  @override
  _Inputs createState() => _Inputs();
}

class _Inputs extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
            child: TextFormField(
                controller: widget.emailController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 238, 54, 177),
                ),
                decoration: InputDecoration(
                    enabledBorder:
                        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder:
                        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    hintStyle: const TextStyle(color: Colors.purple),
                    hintText: widget.emailText,
                    prefixIcon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.email, color: Colors.purple))))),
        Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
                controller: widget.passwordController,
                obscureText: widget.passwordInvisible,
                style: const TextStyle(
                  color: Color.fromARGB(255, 238, 54, 177),
                ),
                decoration: InputDecoration(
                    enabledBorder:
                        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder:
                        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    hintStyle: const TextStyle(color: Colors.purple),
                    hintText: widget.passwordText,
                    prefixIcon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.lock, color: Colors.purple)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.passwordInvisible = !widget.passwordInvisible;
                          });
                        },
                        icon: Icon(
                            widget.passwordInvisible ? Icons.visibility_off : Icons.visibility,
                            color: Colors.purple)))))
      ]),
    );
  }
}

class MainButton extends StatelessWidget {
  var buttonText;
  var buttonAction;

  MainButton({this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: buttonAction,
            child: Text(buttonText)));
  }
}

class SecondaryButton extends StatelessWidget {
  var width;
  var secondaryButtonAction;
  var text;
  var secondaryText;

  SecondaryButton({this.width, required this.secondaryButtonAction, this.text, this.secondaryText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: secondaryButtonAction,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: width / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,
                  style: const TextStyle(
                    color: Colors.purple,
                  )),
              const SizedBox(width: 10),
              Text(secondaryText,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 238, 54, 177),
                  ))
            ],
          ),
        ));
  }
}
