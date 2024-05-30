/*import 'package:flutter/material.dart';
import 'package:spac/not.dart';
import 'package:spac/shop.dart';



class Principale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchBarWidth = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xff00c7a1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Color(0xff00c7a1),
              child: Stack(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff00c7a1),
                    ),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 32,
              width: searchBarWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Recherche',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome, Personne',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text('Pub ${index + 1}'),
                      subtitle: Text('Pub ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Shop()));
                },
              ),
              IconButton(
                icon: Icon(Icons.home, color: Color(0xff00c7a1)),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff00c7a1),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:spac/aide.dart';
import 'package:spac/edit.dart';
import 'package:spac/not.dart';  // Assuming 'not.dart' is the file containing NotificationsPage
import 'package:spac/shop.dart';

class Principale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // استرجاع البيانات الممررة كوسم
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final patientId = args['patientId'];

    // استخدام patientId كمعرف المستخدم في هذه الصفحة

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(patientId: patientId),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String patientId;

  const MyHomePage({Key? key, required this.patientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchBarWidth = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xff00c7a1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 32,
              width: searchBarWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Recherche',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome, Personne',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text('Pub ${index + 1}'),
                      subtitle: Text('Pub ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'nom',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.black),
                          onPressed: () {
                            
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit()));
                          },
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      SizedBox(height: 53),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Shop(
                                product: {
                                  'id': '1', // Assuming product ID
                                  'name': 'Product Name', // Assuming product name
                                  'price': 10.0, // Assuming product price
                                  'description': 'Product Description', // Assuming product description
                                  'imageURL': 'https://example.com/image.jpg', // Assuming product image URL
                                },
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.store),
                          title: Text('Shop'),
                        ),
                      ),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Aide()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.help_outline),
                          title: Text('Aide'),
                        ),
                      ),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          // اضف اجراء هنا عند الضغط على الخروج
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Deconnecter'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
              top: BorderSide(color: Color(0xff00c7a1), width: 2.0),
            ),
            color: Color(0xff00c7a1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Shop(
                          product: {
                            'id': '1', // Assuming product ID
                            'name': 'Product Name', // Assuming product name
                            'price': 10.0, // Assuming product price
                            'description': 'Product Description', // Assuming product description
                            'imageURL': 'https://example.com/image.jpg', // Assuming product image URL
                          },
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(patientId: patientId),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff00c7a1),
    );
  }
}

//nour
/*
import 'package:flutter/material.dart';
import 'package:spac/aide.dart';
import 'package:spac/edit.dart';
import 'package:spac/not.dart';
import 'package:spac/shop.dart';

class Principale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchBarWidth = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xff00c7a1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 32,
              width: searchBarWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Recherche',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome, Personne',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text('Pub ${index + 1}'),
                      subtitle: Text('Pub ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'nom',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.black),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Edit()));
                          },
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      SizedBox(height: 53),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Shop(
                              product: {
                                'id': 'productRef.id',
                                'name': 'productName',
                                'price': 'price',
                                'description': 'description',
                                'imageURL': '_imageFile?.path ?? ''',
                              },
                            ),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.store),
                          title: Text('Shop'),
                        ),
                      ),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Aide()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.help_outline),
                          title: Text('Aide'),
                        ),
                      ),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          // Add action for logout here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Deconnecter'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
              top: BorderSide(color: Color(0xff00c7a1), width: 2.0),
            ),
            color: Color(0xff00c7a1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Shop(
                      product: {
                        'id': 'productRef.id',
                        'name': 'productName',
                        'price': 'price',
                        'description': 'description',
                        'imageURL': '_imageFile?.path ?? ''',
                      },
                    )));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Color(0xff00c7a1)),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Color(0xff00c7a1)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Notifi()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff00c7a1),
    );
  }
}
*/

















/*firebase
import 'package:flutter/material.dart';
import 'package:spac/aide.dart';
import 'package:spac/edit.dart';
//import 'package:spac/not.dart';
import 'package:spac/shop.dart';

class Principale extends StatelessWidget {
  // Ajoutez un argument pour les données du produit
  final Map<String, dynamic> productData;

  // Ajoutez le constructeur pour initialiser les données du produit
  const Principale({Key? key, required this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchBarWidth = screenWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xff00c7a1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 32,
              width: searchBarWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Recherche',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome, Personne',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text('Pub ${index + 1}'),
                      subtitle: Text('Pub ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'nom',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.black),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Edit()));
                          },
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      SizedBox(height: 53),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Shop(product: productData)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.store),
                          title: Text('Shop'),
                        ),
                      ),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Aide()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.help_outline),
                          title: Text('Aide'),
                        ),
                      ),
                      Divider(color: Color(0xff00c7a1)),
                      ElevatedButton(
                        onPressed: () {
                          // اضف اجراء هنا عند الضغط على الخروج
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Deconnecter'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
              top: BorderSide(color: Color(0xff00c7a1), width: 2.0),
            ),
            color: Color(0xff00c7a1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Utilisez les données du produit lors de la navigation vers la page Shop
                IconButton(
                  icon: Icon(Icons.store, color: Color(0xff00c7a1)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Shop(product: productData), // Passez les données du produit à la page Shop
                      ),
                    );
                  },
                ),
                // Votre code existant...
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff00c7a1),
    );
  }
}
*/