/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:spac/shop.dart';

class Ajoutecmd extends StatefulWidget {
  @override
  _AjoutecmdState createState() => _AjoutecmdState();
}

class _AjoutecmdState extends State<Ajoutecmd> {
  XFile? _imageFile;
   //String _selectedCategory = ''; // Define _selectedCategory variable

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null) ...[
              Image.file(
                File(_imageFile!.path),
                height: 100,
                width: 100,
              ),
              SizedBox(height: 10),
            ],
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Ajouter une photo'),
            ),
            SizedBox(height: 20),
            CustomInput(label: 'Nom de Produit'),
            SizedBox(height: 10),
            CustomInput(label: 'Prix'),
            SizedBox(height: 10),
            CustomInput(label: 'Description'),
            SizedBox(height: 20),/*
           DropdownButton<String>(
  value: _selectedCategory,
  onChanged: (newValue) {
    setState(() {
      _selectedCategory = newValue!;
    });
  },
  items: [
    DropdownMenuItem<String>(
      value: 'Aliments',
      child: Text('Aliments'),
    ),
    DropdownMenuItem<String>(
      value: 'Médicaments',
      child: Text('Médicaments'),
    ),
  ],
),*/

            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lors de l'enregistrement
                Navigator.push(context, MaterialPageRoute(builder: (context) => Shop()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color(0xFF00C7A1),
              ),
              child: Text(
                'Partager',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String label;

  const CustomInput({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C7A1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
*/import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Import Firebase Storage package

import 'package:spac/shop.dart';

class Ajoutecmd extends StatefulWidget {
  @override
  _AjoutecmdState createState() => _AjoutecmdState();
}

class _AjoutecmdState extends State<Ajoutecmd> {
  XFile? _imageFile;
  bool _isLoading = false;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> _saveData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Get data from inputs
      String productName = _productNameController.text;
      double price = double.parse(_priceController.text);
      String description = _descriptionController.text;

      // Upload image to Firebase Storage
      String imageURL = '';
      if (_imageFile != null) {
        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('products/${_imageFile!.name}');
        UploadTask uploadTask = storageReference.putFile(File(_imageFile!.path));
        TaskSnapshot taskSnapshot = await uploadTask;
        imageURL = await taskSnapshot.ref.getDownloadURL();
      }

      // Save data to Firestore
      DocumentReference productRef = await FirebaseFirestore.instance.collection('products').add({
        'name': productName,
        'price': price,
        'description': description,
        'imageURL': imageURL,
      });

      // Navigate to Shop screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => Shop(product: {
        'id': productRef.id,
        'name': productName,
        'price': price,
        'description': description,
        'imageURL': imageURL,
      })));
    } catch (e) {
      // Handle errors if any
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null) ...[
              Image.file(
                File(_imageFile!.path),
                height: 100,
                width: 100,
              ),
              SizedBox(height: 10),
            ],
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Ajouter une photo'),
            ),
            SizedBox(height: 20),
            CustomInput(label: 'Nom de Produit', controller: _productNameController),
            SizedBox(height: 10),
            CustomInput(label: 'Prix', controller: _priceController),
            SizedBox(height: 10),
            CustomInput(label: 'Description', controller: _descriptionController),
            SizedBox(height: 20),
            Spacer(),
            if (_isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _saveData,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xFF00C7A1),
                ),
                child: Text(
                  'Partager',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomInput({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C7A1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}





/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package

import 'package:spac/shop.dart';

class Ajoutecmd extends StatefulWidget {
  @override
  _AjoutecmdState createState() => _AjoutecmdState();
}

class _AjoutecmdState extends State<Ajoutecmd> {
  XFile? _imageFile;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> _saveData() async {
    // Get data from inputs
    String productName = _productNameController.text;
    double price = double.parse(_priceController.text);
    String description = _descriptionController.text;

    // Upload image to Firebase Storage (not implemented here, you can do it separately)

    // Save data to Firestore
    DocumentReference productRef = await FirebaseFirestore.instance.collection('products').add({
      'name': productName,
      'price': price,
      'description': description,
      'imageURL': _imageFile?.path ?? '', // You need to upload image to Firebase Storage and get its URL
    });

    // Navigate to Shop screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => Shop(product:{
       'id': productRef.id,
      'name': productName,
      'price': price,
      'description': description,
      'imageURL': _imageFile?.path ?? '',})));
  }

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null) ...[
              Image.file(
                File(_imageFile!.path),
                height: 100,
                width: 100,
              ),
              SizedBox(height: 10),
            ],
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Ajouter une photo'),
            ),
            SizedBox(height: 20),
            CustomInput(label: 'Nom de Produit', controller: _productNameController),
            SizedBox(height: 10),
            CustomInput(label: 'Prix', controller: _priceController),
            SizedBox(height: 10),
            CustomInput(label: 'Description', controller: _descriptionController),
            SizedBox(height: 20),
            Spacer(),
            ElevatedButton(
              onPressed: _saveData,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color(0xFF00C7A1),
              ),
              child: Text(
                'Partager',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomInput({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C7A1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
*/