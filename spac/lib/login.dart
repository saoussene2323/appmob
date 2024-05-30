import 'package:flutter/material.dart';
import 'package:spac/j_ai_un_compte.dart';
//import 'package:spac/j_ai_un_compte.dart';
import 'package:spac/laboratoire.dart';
import 'package:spac/patient.dart';
import 'package:spac/pharmacie.dart';
//import 'package:spac/pharmacie.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PatientPage()));
               
                  //Navigator.pushNamed(context, '/PatientPage');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFF00C7A1), width: 2),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 50),
                    Text(
                      'Patient',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lors du clic sur le bouton "Pharmacie"
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Pharmacie()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFF00C7A1), width: 2),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_pharmacy, size: 50),
                    Text(
                      'Pharmacie',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Laboratoire()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFF00C7A1), width: 2),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.science, size: 50),
                    Text(
                      'Laboratoire',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>Compte()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xFF00C7A1),
                ),
                child: Text(
                  'J\'ai un compte',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
