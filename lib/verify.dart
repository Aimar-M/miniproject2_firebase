import 'package:flutter/material.dart';

import 'home.dart';

class verify extends StatefulWidget {
  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
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
            Text("Verify your phone",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25)),
            Text("We have sent an OTP to the \n phone number specified",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Form(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            labelText: "Enter the 4 digit pin",
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
                    child: Text("Next",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)))),
          ],
        )));
  }
}
