/*
import 'package:flutter/material.dart';
import 'package:spac/motpasse.dart';

//import 'package:spac/shop.dart';


class Compte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInput(label: 'Votre nom'),
              SizedBox(height: 10),
              CustomInput(label: 'Votre Mot_passe', isPassword: true),
              SizedBox(height: 10),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lors de l'enregistrement
                  //Navigator.push(context, MaterialPageRoute(builder: (context) =>Shop ()));
                  
                  final name = nameController.text;
                  final password = passwordController.text;

                  if (name.isNotEmpty && password.isNotEmpty) {
                    // Effectuer l'enregistrement
                    print('Enregistrement effectué avec succès!');
                  } else {
                    // Afficher un message d'erreur si les champs sont vides
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Veuillez remplir tous les champs obligatoires!',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xFF00C7A1),
                ),
                child: Text(
                  'Enregistrer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10), 
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ForgotPasswordPage()),
                  );
                },
                child: Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomInput({required this.label, this.isPassword = false, this.controller});

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C7A1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}

class PasswordForgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: Center(
        child: Text(
          'Page de récupération de mot de passe',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();*/

import 'package:flutter/material.dart';
import 'package:spac/ajoutecmd.dart';
import 'package:spac/motpasse.dart';


//import 'package:spac/shop.dart';


class Compte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInput(label: 'Votre nom'),
              SizedBox(height: 10),
              CustomInput(label: 'Votre Mot_passe', isPassword: true),
              SizedBox(height: 10),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lors de l'enregistrement
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Ajoutecmd ()));
                  
                  final name = nameController.text;
                  final password = passwordController.text;

                  if (name.isNotEmpty && password.isNotEmpty) {
                    // Effectuer l'enregistrement
                    print('Enregistrement effectué avec succès!');
                  } else {
                    // Afficher un message d'erreur si les champs sont vides
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Veuillez remplir tous les champs obligatoires!',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xFF00C7A1),
                ),
                child: Text(
                  'Enregistrer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10), 
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                    ForgotPasswordPage()),
                  );
                },
                child: Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomInput({required this.label, this.isPassword = false, this.controller});

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C7A1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}

class PasswordForgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: Center(
        child: Text(
          'Page de récupération de mot de passe',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

