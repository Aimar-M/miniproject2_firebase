import 'dart:async';
import 'home.dart';
import 'login.dart';
import 'signup.dart';

import 'package:flutter/material.dart';
import 'package:rushgrocery/login.dart';

import 'verify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rush Groceries",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Splash(),
      routes: {
        '/second': (context) => login(),
        '/third': (context) => signup(),
        '/fourth': (context) => verify(),
        '/fifth': (context) => home(),
      },
      initialRoute: '/',
    );
  }
}

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text("Rush Grocery",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25)),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Image.asset(
                  'assets/images/Rectangle 299.png',
                  fit: BoxFit.fill,
                ),
              ),
            ])));
  }
}
