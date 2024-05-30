import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:spac/description.dart';
import 'package:spac/principale.dart';
import 'dart:io';
//import 'package:spac/product.dart'; // استيراد صفحة تفاصيل المنتج


class Shopuser extends StatefulWidget {
  final Map<String, dynamic> product;

  const Shopuser({Key? key, required this.product}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shopuser> {
  List<Map<String, dynamic>> _products = [];
  List<String> _ads = [];
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _loadAds();
  }

  Future<void> _loadProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? productsJson = prefs.getStringList('products');
    if (productsJson != null) {
      setState(() {
        _products = productsJson.map((product) => json.decode(product) as Map<String, dynamic>).toList();
      });
    }
    _addProduct(widget.product);
  }

  Future<void> _saveProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsJson = _products.map((product) => json.encode(product)).toList();
    await prefs.setStringList('products', productsJson);
  }

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
    _saveProducts();
  }

  Future<void> _loadAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? adsJson = prefs.getStringList('ads');
    if (adsJson != null) {
      setState(() {
        _ads = adsJson;
      });
    }
  }

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      _cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
            
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_ads.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: _ads.map((ad) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.file(
                        File(ad),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.6, // Adjusted to give more height to each card
                ),
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildProductItem(_products[index]);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation bar item taps
        },
      ),
    );
  }

  Widget _buildProductItem(Map<String, dynamic> product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Principale()),
          ).then((value) {
            if (value != null) {
              _addToCart(value);
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: product['imageURL'] != null
                    ? Image.network(
                        product['imageURL'],
                        fit: BoxFit.cover,
                      )
                    : Placeholder(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'] ?? '',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$${product['price'] ?? ''}',
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        product['description'] ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
