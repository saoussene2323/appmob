/*
import 'package:firebase_core/firebase_core.dart';
//import'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:spac/firebase_options.dart';
import 'package:spac/login.dart'; // Assurez-vous que le chemin d'accès est correct
import 'package:spac/patient.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/LoginPage': (context) => LoginPage(),
        '/PatientPage' : (context) => PatientPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logoo.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Le Cancer, On Le Combat Ensemble',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF00C7A1),
                fontWeight: FontWeight.bold,
                fontSize: 37.0,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LoginPage');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Color(0xFF00C7A1)),
                ),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'En Commence',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spac/firebase_options.dart';
import 'package:spac/login.dart';
import 'package:spac/patient.dart';
import 'notification_service.dart';
import 'not.dart'; // استيراد صفحة الإشعارات

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/LoginPage': (context) => LoginPage(),
        '/PatientPage': (context) => PatientPage(),
        '/NotificationsPage': (context) => NotificationsPage(
            patientId: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logoo.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Le Cancer, On Le Combat Ensemble',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF00C7A1),
                fontWeight: FontWeight.bold,
                fontSize: 37.0,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LoginPage');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Color(0xFF00C7A1)),
                ),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'En Commence',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}