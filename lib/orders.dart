import 'package:flutter/material.dart';
import 'home.dart';
import 'wishlist.dart';
import 'cart.dart';
import 'browse.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<Widget> pages = [
    const HomeScreen(),
    BrowseItemsPage(),
    OrderPage(),
    OrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Transactions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'March 2023',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    backgroundColor: Color(0xffe0f2e1)),
              ),
            ),
          ]),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildTransactionCard(
                  'Product 1',
                  10.0,
                  'Processing',
                ),
                _buildTransactionCard(
                  'Product 2',
                  20.0,
                  'Delivered',
                ),
                _buildTransactionCard(
                  'Product 3',
                  15.0,
                  'Cancelled',
                ),
              ],
            ),
          ),
        ],
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
            MaterialPageRoute(builder: (context) => pages[0]),
          );
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildTransactionCard(String name, double price, String status) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                width: 60,
                height: 60,
                child: Image.network('https://via.placeholder.com/150x150',
                    fit: BoxFit.fill)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                status,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    backgroundColor: Color(0xffe0f2e1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
