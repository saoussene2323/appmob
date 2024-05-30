/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spac/pharmaprincipal.dart';
import 'package:url_launcher/url_launcher.dart';


class Laboratoire extends StatefulWidget {
  @override
  _LaboratoireState createState() => _LaboratoireState();
}

class _LaboratoireState extends State<Laboratoire> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
 
  final TextEditingController addressController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir le nom du Laboratoire';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Le nom doit contenir uniquement des lettres';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir votre adresse e-mail';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Adresse e-mail invalide';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir l adresse du Laboratoire';
    }
    // Vous pouvez ajouter d'autres validations si nécessaire
    return null;
  }
    // Vous pouvez ajouter d'autres validations si nécessaire
    

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir votre mot de passe';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    // Vous pouvez ajouter d'autres validations si nécessaire
    return null;
  }

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': nameController.text,
        //'lastName': lastNameController.text,
        //'age': ageController.text,
        'address': addressController.text,
        //'hospital': hospitalController.text,
      });
      print('Utilisateur enregistré: ${userCredential.user!.uid}');
    } catch (e) {
      print('Échec de l\'enregistrement de l\'utilisateur: $e');
      // Gérer l'erreur ici
    }
  }

  void openGoogleMaps(String address) async {
    final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Impossible d\'ouvrir Google Maps';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inscription'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInput(
                    controller: emailController,
                    label: 'Adresse e-mail',
                    validator: validateEmail,
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: nameController,
                    label: ' Nom du Laboratoire',
                    validator: validateName,
                  ),
                  SizedBox(height: 10),
                 
                  CustomInput(
                    controller: addressController,
                    label: ' adresse du Laboratoire',
                    validator: validateAddress,
                    onTapIcon: () {
                      openGoogleMaps(addressController.text);
                    },
                    icon: Icons.location_on,
                  ),
                  
                 
                  SizedBox(height: 10),
                  CustomInput(
                    controller: passwordController,
                    label: 'Mot de passe',
                    isPassword: true,
                    validator: validatePassword,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerWithEmailAndPassword(emailController.text, passwordController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Pharmaprincipal ()));
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Enregistrer',
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
                      minimumSize: Size(250, 50),
                       backgroundColor: Color(0xFF00C7A1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final IconData? icon;
  final VoidCallback? onTapIcon;

  const CustomInput({
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.icon,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C7A1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: TextStyle(color: Colors.red),
        suffixIcon: icon != null
            ? IconButton(
                icon: Icon(icon),
                onPressed: onTapIcon,
              )
            : null,
      ),
    );
  }
}*/import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chercher_malade.dart'; // Make sure to import the correct file for Chercher
import 'package:url_launcher/url_launcher.dart';

class Laboratoire extends StatefulWidget {
  @override
  _LaboratoireState createState() => _LaboratoireState();
}

class _LaboratoireState extends State<Laboratoire> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir le nom du Laboratoire';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Le nom doit contenir uniquement des lettres';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir votre adresse e-mail';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Adresse e-mail invalide';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir l adresse du Laboratoire';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Veuillez saisir votre mot de passe';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    return null;
  }

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Add user information along with uid to Firestore
      await FirebaseFirestore.instance.collection('laboratoires').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid, // Add uid
        'email': email,
        'name': nameController.text,
        'address': addressController.text,
      });
      print('Utilisateur enregistré: ${userCredential.user!.uid}');

      // Navigate to Chercher page with laboratoireId
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Chercher(laboratoireId: userCredential.user!.uid),
        ),
      );

    } catch (e) {
      print('Échec de l\'enregistrement de l\'utilisateur: $e');
    }
  }

  void openGoogleMaps(String address) async {
    final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Impossible d\'ouvrir Google Maps';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inscription'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInput(
                    controller: emailController,
                    label: 'Adresse e-mail',
                    validator: validateEmail,
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: nameController,
                    label: 'Nom du Laboratoire',
                    validator: validateName,
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: addressController,
                    label: 'Adresse du Laboratoire',
                    validator: validateAddress,
                    onTapIcon: () {
                      openGoogleMaps(addressController.text);
                    },
                    icon: Icons.location_on,
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    controller: passwordController,
                    label: 'Mot de passe',
                    isPassword: true,
                    validator: validatePassword,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerWithEmailAndPassword(emailController.text, passwordController.text);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Enregistrer',
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
                      minimumSize: Size(250, 50),
                      backgroundColor: Color(0xFF00C7A1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final IconData? icon;
  final VoidCallback? onTapIcon;

  const CustomInput({
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.icon,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C7A1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: TextStyle(color: Colors.red),
        suffixIcon: icon != null
            ? IconButton(
                icon: Icon(icon),
                onPressed: onTapIcon,
              )
            : null,
      ),
    );
  }
}
