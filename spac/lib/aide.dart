import 'package:flutter/material.dart';



class Aide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.help, color: Colors.black),
              onPressed: () {
                // Add your help logic here
              },
            ),
            Text(
              'Aide',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 300, // تحديد العرض
          height: 200, // تحديد الارتفاع
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Ecrire votre problème...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          padding: EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              // Add your send logic here
            },
            child: Text(
              'Envoyer',
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
      ),
    );
  }
}