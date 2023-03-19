import 'package:flutter/material.dart';
import 'address.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> items = [
    {"name": "Item 1", "price": 10.0, "quantity": 1},
    {"name": "Item 2", "price": 20.0, "quantity": 2},
    {"name": "Item 3", "price": 15.0, "quantity": 1},
  ];

  @override
  Widget build(BuildContext context) {
    double deliveryAmount = 5.0;
    double totalPrice =
        items.fold(0, (sum, item) => sum + item["price"] * item["quantity"]);
    double total = totalPrice + deliveryAmount;

    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAddressPage()),
                  );
                },
                child: Row(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Text(
                      'Deliver to Rebero Apartments, Zindiro',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7a7979),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),

                              primary: Colors
                                  .white, // set the background color of the button
                            ),
                            child: Text("Change",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15)),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddAddressPage())),
                          ))),
                ])),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Image.network(
                              'https://via.placeholder.com/150x150',
                              fit: BoxFit.fill)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(items[index]["name"]),
                          SizedBox(height: 4.0),
                          Text("\$${items[index]["price"]}"),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (items[index]["quantity"] > 1) {
                                  items[index]["quantity"]--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text("${items[index]["quantity"]}"),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                items[index]["quantity"]++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Price Details",
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 8.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${items[index]["name"]} x ${items[index]["quantity"]}"),
                              Text(
                                  "\$${items[index]["price"] * items[index]["quantity"]}"),
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Amount"),
                          Text("\$$deliveryAmount"),
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${total.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
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
                              child: Text("Continue To Payment",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15)),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage())),
                            ))),
                  ]))
        ]));
  }
}
