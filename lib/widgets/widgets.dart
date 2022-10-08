import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget{
  Logo({
    this.height
  });

  var height;

  @override
  Widget build(BuildContext context){
    return Container(
            margin:EdgeInsets.all(15),
            height:height/3.5,
            child:Image.asset("assets/images/rtchat.png")
           );
  }
}

class MainText extends StatelessWidget{
  MainText({
    this.text
  });

  var text;

  @override
  Widget build(BuildContext context){
    return Container(
            margin:EdgeInsets.only(bottom:30),
            child: Text(text, style:GoogleFonts.secularOne(
            fontSize: 30,
            color: Colors.purple
             ))
            );
  }
}

class Inputs extends StatefulWidget{

  var emailText;
  var passwordText;

  Inputs({this.emailText, this.passwordText});

  @override
  _Inputs createState()=> _Inputs();
}

class _Inputs extends State<Inputs>{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
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
                hintText:widget.emailText,
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
                      hintText:widget.passwordText,
                      prefixIcon: Container(
                        margin:EdgeInsets.only(right: 10),
                        child: Icon(Icons.lock, color:Colors.purple)
                      )
                    )
                  )
                )
      ]
    );
  }
}


class MainButton extends StatelessWidget{

  var buttonText;
  var buttonAction;

  MainButton({this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context){
    return  Container(
                  margin:EdgeInsets.only(
                    top:20
                  ),
                  child:ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple
                    ),
                    onPressed:buttonAction,
                    child:Text(buttonText)
                  )
                );
  }
}

class SecondaryButton extends StatelessWidget{

  var width;
  var secondaryButtonAction;
  var text;
  var secondaryText;

  SecondaryButton({
  this.width, required this.secondaryButtonAction,this.text, this.secondaryText
  });

  @override
  Widget build(BuildContext context){
    return    TextButton(
                  onPressed:(){
                    Navigator.pushNamed(context, "/login");
                  },
                  child:Container(
                    margin:EdgeInsets.only(top:10),
                    width:width/1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(text, style:TextStyle(
                          color:Colors.purple,
                        )),
                        SizedBox(width:10),
                        Text(secondaryText, style:TextStyle(
                          color:Color.fromARGB(255, 238, 54, 177),
                        ))
                      ],
                    ),
                  )
                );
  }
}