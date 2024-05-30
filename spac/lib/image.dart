import 'package:flutter/material.dart';



class ResultatAnalysePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Resultat d\'analyse',
                    labelStyle: TextStyle(color: Colors.green),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Action lorsque le bouton "Oui" est pressé
                            },
                            style: ElevatedButton.styleFrom(
                             // primary: Colors.green,
                            ),
                            child: Text('Oui'),
                          ),
                          SizedBox(width: 60), // Espace entre les boutons "Oui" et "Non"
                          ElevatedButton(
                            onPressed: () {
                              // Action lorsque le bouton "Non" est pressé
                            },
                            style: ElevatedButton.styleFrom(
                              //primary: Colors.red,
                            ),
                            child: Text('Non'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action lorsque le bouton "Terminer" est pressé
                },
                style: ElevatedButton.styleFrom(
                  //primary: Colors.white, // Couleur de fond blanche
                  //onPrimary: Colors.green, // Couleur du texte en vert
                  side: BorderSide(color: Colors.green), // Bordure verte
                ),
                child: Text('Terminer'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}