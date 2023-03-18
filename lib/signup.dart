import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'verify.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context))),
            Text("Welcome to Rush Grocery",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25)),
            Text("Login To Your Account",
                style: TextStyle(color: Colors.white, fontSize: 15)),
            Form(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            labelText: 'First Name',
                            hintText: 'Enter your first name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white)))),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            hintText: 'Enter your last name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white)))),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'Enter your phone number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white)))),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white)))),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white)))),
                  )),
            ])),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.1,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => verify()),
                        ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                      primary: Colors
                          .white, // set the background color of the button
                    ),
                    child: Text("SignUp",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)))),
            Text("Forgot Your Password?",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Have Have An Account? ",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              ElevatedButton(
                child: Text("Log In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20)),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                ),
              )
            ])
          ],
        )));
  }
}
