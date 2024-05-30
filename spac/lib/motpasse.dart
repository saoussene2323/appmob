import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      setState(() {
        _errorMessage = 'Un e-mail de réinitialisation a été envoyé à ${_emailController.text}.';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erreur: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _resetPassword,
                style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00C7A1)),),
                child: Text('Réinitialiser le mot de passe',
                 style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 10.0),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*void main() {
  runApp(MaterialApp(
    title: 'Password Reset',
    home: ForgotPasswordPage(),
  ));
}*/
