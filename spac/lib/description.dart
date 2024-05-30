import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productName;
  final String productDescription;
  final List<String> productImages;

  ProductDetailsPage({
    required this.productName,
    required this.productDescription,
    required this.productImages,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int currentImageIndex = 0;

  void nextImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % widget.productImages.length;
    });
  }

  void previousImage() {
    setState(() {
      currentImageIndex = (currentImageIndex - 1 + widget.productImages.length) % widget.productImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du produit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: GestureDetector(
                onTap: nextImage,
                child: Image.network(
                  widget.productImages[currentImageIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.productDescription,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.black),
                    onPressed: previousImage,
                  ),
                  Text(
                    '${currentImageIndex + 1} / ${widget.productImages.length}',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.black),
                    onPressed: nextImage,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action lorsque le bouton "Ajouter au panier" est pressé
              },
              style: ElevatedButton.styleFrom(
                //primary: Color(0xff00c7a1),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Ajouter au panier',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
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
}