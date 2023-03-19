import 'package:flutter/material.dart';
import 'package:rushgrocery/cart.dart';
import 'package:rushgrocery/orders.dart';
import 'browse.dart';
import 'wishlist.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final List<Widget> pages = [
    home(),
    BrowseItemsPage(),
    OrderPage(),
    OrderPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Groceries',
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wishlist()),
                );
              },
              child: IconButton(
                icon: Icon(Icons.favorite),
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
                icon: Icon(Icons.shopping_cart),
                onPressed: null,
              ),
            ),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                    width: 330,
                    child: BottomAppBar(
                      shape: CircularNotchedRectangle(),
                      child: Row(children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Open drawer
                          },
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search Product',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ]),
                    )),
              ))),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "START  SHOPPING  NOW",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowseItemsPage()),
                      );
                    },
                    child: Stack(children: [
                      Container(
                          child: Image.asset(
                        "assets/images/Rectangle 29.png",
                      )),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Text("Pastry",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowseItemsPage()),
                      );
                    },
                    child: Stack(children: [
                      Container(
                        child: Image.asset(
                          "assets/images/Rectangle 30.png",
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Text("Vegetables",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowseItemsPage()),
                      );
                    },
                    child: Stack(children: [
                      Container(
                          child: Image.asset(
                        "assets/images/Rectangle 31.png",
                      )),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Text("Eggs",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BrowseItemsPage()),
                        );
                      },
                      child: Stack(children: [
                        Container(
                            child: Image.asset("assets/images/Rectangle 32.png",
                                fit: BoxFit.fill)),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: Text("Fruit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )
                      ])),
                ],
              ),
            )
          ])),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // Navigates to the corresponding page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages[index]),
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: "Order History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
