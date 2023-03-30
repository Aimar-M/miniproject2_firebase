import 'package:flutter/material.dart';
import 'home.dart';

class wishlist extends StatefulWidget {
  const wishlist({Key? key}) : super(key: key);

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  final List<Widget> pages = [
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
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
              ));
        }),
      ),
    );
  }
}
