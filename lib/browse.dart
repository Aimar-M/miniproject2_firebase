import 'package:flutter/material.dart';
import 'package:rushgrocery/cart.dart';
import 'home.dart';
import 'wishlist.dart';
import 'productdetails.dart';
import 'orders.dart';

class BrowseItemsPage extends StatefulWidget {
  @override
  State<BrowseItemsPage> createState() => _BrowseItemsPageState();
}

class _BrowseItemsPageState extends State<BrowseItemsPage> {
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
            'Browse',
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
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => product()),
                  );
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.height * 0.30,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Image.network(
                              'https://via.placeholder.com/150x150',
                              fit: BoxFit.fill)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Product $index',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(
                          '\$${(index + 1) * 10}',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: (int index) {
          // Navigates to the corresponding page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages[index]),
          );
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
