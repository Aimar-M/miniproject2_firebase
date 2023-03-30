import 'package:flutter/material.dart';
import 'package:rushgrocery/cart.dart';
import 'home.dart';
import 'wishlist.dart';
import 'productdetails.dart';
import 'orders.dart';

class BrowseItemsPage extends StatefulWidget {
  const BrowseItemsPage({Key? key}) : super(key: key);

  @override
  State<BrowseItemsPage> createState() => _BrowseItemsPageState();
}

class _BrowseItemsPageState extends State<BrowseItemsPage> {
  final List<Widget> pages = [
    const HomeScreen(),
    const BrowseItemsPage(),
    const OrderPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Browse',
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const wishlist()),
                );
              },
              child: const IconButton(
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
              child: const IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: null,
              ),
            ),
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: 330,
                    child: BottomAppBar(
                      shape: const CircularNotchedRectangle(),
                      child: Row(children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // Open drawer
                          },
                        ),
                        const Expanded(
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
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(
                          '\$${(index + 1) * 10}',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
              icon: const Icon(Icons.search), label: "Browse"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.book), label: "Order History"),
          const BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: "Profile"),
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
        selectedLabelStyle: const TextStyle(color: Colors.green),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
