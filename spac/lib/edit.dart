import 'package:flutter/material.dart';
class Edit extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Edit> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController adresseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);

          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          TextField(
            controller: nomController,
            decoration: InputDecoration(
              labelText: 'Changer votre nom',
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF00C7A1)),
              ),
            ),
          ),
          Divider(color: Color(0xFF00C7A1)),
          TextField(
            controller: prenomController,
            decoration: InputDecoration(
              labelText: 'Changer votre prenom',
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF00C7A1)),
              ),
            ),
          ),
          Divider(color: Color(0xFF00C7A1)),
          TextField(
            controller: adresseController,
            decoration: InputDecoration(
              labelText: 'Changer votre adresse',
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF00C7A1)),
              ),
            ),
          ),
          Divider(color: Color(0xFF00C7A1)),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            String nom = nomController.text;
            String prenom = prenomController.text;
            String adresse = adresseController.text;

            // Add your save logic here
            print('Nom: $nom, Prenom: $prenom, Adresse: $adresse');
          },
          child: Text(
            'Enregister',
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFF00C7A1)),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}