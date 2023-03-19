import 'package:flutter/material.dart';
import 'wishlist.dart';
import 'home.dart';
import 'cart.dart';

class product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.30,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wishlist()),
                );
              },
              child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: null,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: null,
              ),
            ),
          ],
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://www.shutterstock.com/image-photo/red-apple-isolated-on-white-260nw-1727544364.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Apple',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff666565)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '\$5',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Details',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Price Type',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Vendors',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),

                        primary: Colors
                            .white, // set the background color of the button
                      ),
                      child: Text("Add To Cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage())),
                    ))),
          ],
        ),
      ),
    );
  }
}
