/*import 'package:flutter/material.dart';
import 'package:spac/detaille.dart';




class NewPageWithTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductPage(

    );

  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();

}

class _ProductPageState extends State<ProductPage> {
  int productCount = 5;

  void incrementProductCount() {
    setState(() {
      productCount++;
    });
  }

  void decrementProductCount() {
    setState(() {
      if (productCount > 0) {
        productCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 40.0; // انخفاض ارتفاع الشريط الأبيض
    double bottomBarHeight = 80.0; // زيادة ارتفاع الشريط الأسود
    double greenBarHeight = 80.0; // ارتفاع الشريط الأخضر

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00c7a1),
        title: Text(
          'Mon Panier',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Nom de Produit',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        decrementProductCount();
                      },
                      icon: Icon(Icons.remove_circle),
                      color: Colors.grey[500],
                    ),
                    Text(
                      '$productCount',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        incrementProductCount();
                      },
                      icon: Icon(Icons.add_circle),
                      color: Color(0xff00c7a1),
                    ),
                  ],
                ),
                Text(
                  'Prix',
                  style: TextStyle(color: Color(0xff00c7a1), fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: appBarHeight,
            color: Colors.white,
          ),
          Container(
            height: bottomBarHeight,
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Supprimer ce produit',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Action when "oui" button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff00c7a1),
                        ),
                        child: Text('Oui'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Action when "non" button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text('Non'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Container(
                  height: greenBarHeight, // تعديل الارتفاع هنا
                  color: Color(0xff00c7a1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'total',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Detaille()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                        ),
                        child: Text(
                          'commander',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'prix',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xff00c7a1), width: 2.0),
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
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PanierPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const PanierPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item['product']['price'] * item['quantity']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: item['product']['imageURL'] != null
                          ? Image.network(item['product']['imageURL'], width: 50, height: 50, fit: BoxFit.cover)
                          : Placeholder(),
                      title: Text(item['product']['name']),
                      subtitle: Text('Quantity: ${item['quantity']}'),
                      trailing: Text('\$${item['product']['price'] * item['quantity']}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text('Total: \$${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _confirmPurchase(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Confirm Purchase',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF00C7A1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmPurchase(BuildContext context) async {
    for (var item in cartItems) {
      Command command = Command(
        id: '', // The ID will be generated by Firestore
        productName: item['product']['name'],
        quantity: item['quantity'],
        customerName: 'Customer Name', // Replace with actual customer name
      );
      await FirestoreService().addCommand(command);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Purchase confirmed!')),
    );
  }
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addCommand(Command command) async {
    await _db.collection('commands').add(command.toFirestore());
  }
}

class Command {
  final String id;
  final String productName;
  final int quantity;
  final String customerName;
  bool processed;

  Command({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.customerName,
    this.processed = false,
  });

  factory Command.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Command(
      id: doc.id,
      productName: data['productName'] ?? '',
      quantity: data['quantity'] ?? 0,
      customerName: data['customerName'] ?? '',
      processed: data['processed'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'productName': productName,
      'quantity': quantity,
      'customerName': customerName,
      'processed': processed,
    };
  }
}

