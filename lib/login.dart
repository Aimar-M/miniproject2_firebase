import 'package:flutter/material.dart';
import 'package:rushgrocery/signup.dart';
import 'home.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
            ])),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.1,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => home()),
                        ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                      primary: Colors
                          .white, // set the background color of the button
                    ),
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)))),
            Text("Forgot Your Password?",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don't Have An Account? ",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              ElevatedButton(
                child: Text("Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20)),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signup()),
                ),
              )
            ])
          ],
        )));
  }
}
