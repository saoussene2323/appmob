/*Firebase

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package

class Shop extends StatelessWidget {
  final Map<String, dynamic> product;

  const Shop({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // تعطيل شريط Debug
      home: MyHomePage(product: product),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map<String, dynamic> product;

  const MyHomePage({Key? key, required this.product}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Extract product data
    String productName = widget.product['name'];
    double price = widget.product['price'];
    String description = widget.product['description'];
    String imageURL = widget.product['imageURL'];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.store, color: Colors.black),
              onPressed: () {},
            ),
            Text(
              'Shop',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 60, 8.0, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Table(
                    defaultColumnWidth: FlexColumnWidth(1.0),
                    border: TableBorder.symmetric(inside: BorderSide(color: Colors.black)),
                    children: [
                      TableRow(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Aliments',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Medicaments',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              // Display the added product
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: InkWell(
                  onTap: () {
                    // Action on tap if needed
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Display product details
                          Text(productName, style: TextStyle(color: Colors.black)),
                          Text(description, style: TextStyle(color: Colors.black)),
                          Text('\$ $price', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      // You can display the product image here using imageURL
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color:Color(0xff00c7a1), width: 2.0),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/













import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  final Map<String, dynamic> product;

  const Shop({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // تعطيل شريط Debug
      home: MyHomePage(product: product),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map<String, dynamic> product;

  const MyHomePage({Key? key, required this.product}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Extract product data
    String productName = widget.product['name'];
    double price = widget.product['price'];
    String description = widget.product['description'];
    String imageURL = widget.product['imageURL'];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.store, color: Colors.black),
              onPressed: () {},
            ),
            Text(
              'Shop',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 60, 8.0, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Table(
                    defaultColumnWidth: FlexColumnWidth(1.0),
                    border: TableBorder.symmetric(inside: BorderSide(color: Colors.black)),
                    children: [
                      TableRow(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Aliments',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Medicaments',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              // Display the added product
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: InkWell(
                  onTap: () {
                    // Action on tap if needed
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Display product image if available
                          if (imageURL.isNotEmpty)
                            Image.network(imageURL, height: 100, width: 100),
                          // Display product details
                          Text(productName, style: TextStyle(color: Colors.black)),
                          Text(description, style: TextStyle(color: Colors.black)),
                          Text('\$ $price', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color:Color(0xff00c7a1), width: 2.0),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*

import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // تعطيل شريط Debug
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showFood = true; // للتحكم في ظهور المستطيلات 1, 2, 3, 4
  bool showMedicine = true; // للتحكم في ظهور المستطيلات 5, 6, 7, 8

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.store, color: Colors.black),
              onPressed: () {},
            ),
            Text(
              'Shop',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 60, 8.0, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Table(
                    defaultColumnWidth: FlexColumnWidth(1.0),
                    border: TableBorder.symmetric(inside: BorderSide(color: Colors.black)),
                    children: [
                      TableRow(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                showFood = true;
                                showMedicine = false;
                              });
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Aliments',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showFood = false;
                                showMedicine = true;
                              });
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Medicaments',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  if (showFood) ...[
                    for (int i = 1; i <= 4; i++)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Pressed on  $i');
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$i', style: TextStyle(color: Colors.black)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.attach_money, size: 30, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                  if (showMedicine) ...[
                    for (int i = 5; i <= 8; i++)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Pressed on  $i');
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$i', style: TextStyle(color: Colors.black)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.attach_money, size: 30, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color:Color(0xff00c7a1), width: 2.0),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


*/