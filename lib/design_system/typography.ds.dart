import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



// ButtonText1
class ButtonText1 extends StatelessWidget {
  ButtonText1({ Key? key, required this.title, this.color }) : super(key: key);
  
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 2),
    );
  }
}


// BodyText1
class TextBody1 extends StatelessWidget {
  TextBody1({ Key? key,required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24),
    );
  }
}


// Headline 1
class Headline1 extends StatelessWidget {
  Headline1({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 56, color: color),
    );
  }
}


// Headline 2
class Headline2 extends StatelessWidget {
  Headline2({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    );
  }
}


// Headline 3
class Headline3 extends StatelessWidget {
  Headline3({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 36,),
    );
  }
}


// Headline 4
class Headline4 extends StatelessWidget {
  Headline4({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 32,),
    );
  }
}


// Headline 5
class Headline5 extends StatelessWidget {
  Headline5({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}


// Headline 6
class Headline6 extends StatelessWidget {
  Headline6({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}