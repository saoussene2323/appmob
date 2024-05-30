import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'envoyer_resultats.dart'; // Import ProfilePage

class Chercher extends StatefulWidget {
  final String laboratoireId;

  Chercher({required this.laboratoireId});

  @override
  _ChercherState createState() => _ChercherState();
}

class _ChercherState extends State<Chercher> {
  final TextEditingController searchController = TextEditingController();
  List<String> emails = [];

  @override
  void initState() {
    super.initState();
    fetchEmails();
  }

  Future<void> fetchEmails() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('laboratoires').doc(widget.laboratoireId).collection('patients').get();
      if (querySnapshot.docs.isNotEmpty) {
        final List<String> fetchedEmails = [];
        querySnapshot.docs.forEach((doc) {
          final data = doc.data() as Map<String, dynamic>;
          final email = data['email'] as String?;
          if (email != null) {
            fetchedEmails.add(email);
          }
        });
        setState(() {
          emails = fetchedEmails;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors du chargement des e-mails: $e')),
      );
    }
  }

  Future<void> searchPatient(BuildContext context) async {
    String email = searchController.text.trim();
    if (email.isNotEmpty) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var patientDoc = querySnapshot.docs.first;
          var patientData = patientDoc.data() as Map<String, dynamic>;
          var patientId = patientDoc.id;

          // Adding patient to laboratoire's patients collection
          await FirebaseFirestore.instance
              .collection('laboratoires')
              .doc(widget.laboratoireId)
              .collection('patients')
              .doc(patientId)
              .set(patientData);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(patientData: patientData, patientId: patientId),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Aucun patient trouvé avec cet e-mail.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de la recherche: $e')),
        );
      }
    }
  }

  Future<void> addEmail(BuildContext context) async {
    String email = searchController.text.trim();
    if (email.isNotEmpty) {
      try {
        if (!emails.contains(email)) {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: email)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            var patientDoc = querySnapshot.docs.first;
            var patientData = patientDoc.data() as Map<String, dynamic>;
            var patientId = patientDoc.id;

            await FirebaseFirestore.instance
                .collection('laboratoires')
                .doc(widget.laboratoireId)
                .collection('patients')
                .doc(patientId)
                .set(patientData);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('E-mail ajouté avec succès!')),
            );

            fetchEmails();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("L'e-mail n'existe pas!")),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("L'e-mail existe déjà!")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de l\'ajout de l\'e-mail: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chercher Patient'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: searchController,
                onChanged: (value) {
                  searchPatient(context); // Start searching automatically on text change
                },
                decoration: InputDecoration(
                  hintText: 'Recherche de Patient par e-mail',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  itemBuilder: (context, index) {
                    final email = emails[index];
                    return ListTile(
                      title: Text(email),
                      onTap: () {
                        searchController.text = email;
                        searchPatient(context);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => searchPatient(context),
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Rechercher',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => addEmail(context),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff00c7a1),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}