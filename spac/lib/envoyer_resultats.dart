import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> patientData;
  final String patientId;

  ProfilePage({required this.patientData, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil du Patient'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton "plus"
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email: ${patientData['email'] ?? ''}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Patient: ${patientData['name'] ?? ''} ${patientData['lastName'] ?? ''}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Hôpital: ${patientData['hospital'] ?? ''}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Âge: ${patientData['age'] ?? ''}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Adresse: ${patientData['address'] ?? ''}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action à effectuer lors du clic sur le bouton "plus"
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Compte:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action pour ouvrir le compte du patient
                    },
                    child: Text(
                      'Ouvrir le compte',
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();

                        if (result != null) {
                          String? filePath = result.files.single.path;
                          print('Fichier sélectionné: $filePath');

                          try {
                            // Ajouter le fichier à Firestore
                            await FirebaseFirestore.instance.collection('files').add({
                              'patientId': patientId,
                              'filePath': filePath,
                              'timestamp': DateTime.now(),
                            });
                            print('Fichier ajouté à Firestore.');

                            // Envoyer la notification
                            var notification_service;
                            await notification_service.sendFileNotificationToPatient(patientId, filePath!);
                            print('Notification envoyée.');
                          } catch (e) {
                            print('Erreur lors de l\'ajout du fichier ou de l\'envoi de la notification: $e');
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Importer les résultats',
                            style: TextStyle(color: Color(0xff00c7a1)),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.file_download,
                            color: Color(0xff00c7a1),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: Color(0xff00c7a1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 200.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action à effectuer lors du clic sur le bouton "Envoyer les analyses"
                      },
                      child: Text(
                        'Envoyer les analyses',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff00c7a1)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 200.0,
                    child: OutlinedButton(
                      onPressed: () {
                        // Action à effectuer lors du clic sur le bouton "Retour"
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Retour',
                            style: TextStyle(color: Color(0xff00c7a1)),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: Color(0xff00c7a1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}