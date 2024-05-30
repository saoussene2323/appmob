import 'package:flutter/material.dart';
import 'package:spac/panier.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _quantity = 1;
  List<Map<String, dynamic>> _cartItems = []; // Initialize _cartItems

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name'] ?? 'Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: widget.product['imageURL'] != null
                  ? Image.network(
                      widget.product['imageURL'],
                      fit: BoxFit.cover,
                    )
                  : Placeholder(),
            ),
            SizedBox(height: 16),
            Text(
              widget.product['name'] ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '\$${widget.product['price'] ?? ''}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              widget.product['description'] ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Quantity:', style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                    });
                  },
                ),
                Text('$_quantity', style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _confirmOrder(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Confirm Order',
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

  void _confirmOrder(BuildContext context) {
    Map<String, dynamic> cartItem = {
      'product': widget.product,
      'quantity': _quantity,
    };

    _cartItems.add(cartItem); // Add the item to _cartItems

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PanierPage(cartItems: _cartItems), // Pass _cartItems to PanierPage
      ),
    );
  }
}
