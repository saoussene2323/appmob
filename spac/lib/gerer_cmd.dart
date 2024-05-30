import 'package:flutter/material.dart';
import 'package:spac/pharmaprincipal.dart';


class Command {
  final String id;
  final String productName;
  final int quantity;
  final String customerName;
  bool processed; // Add a boolean flag to track if the command is processed or not

  Command({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.customerName,
    this.processed = false, // Default value for processed is false
  });
}


class CommandPage extends StatefulWidget {
  @override
  _CommandPageState createState() => _CommandPageState();
}

class _CommandPageState extends State<CommandPage> {
  List<Command> commands = [
    Command(id: '1', productName: 'Paracetamol', quantity: 2, customerName: 'Imene'),
    Command(id: '2', productName: 'Aspirin', quantity: 1, customerName: 'Saoussene'),
    Command(id: '3', productName: 'Amoxicillin', quantity: 3, customerName: 'Abir'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Ajoutez ici la navigation vers l'interface précédente
          },
        ),
      ),
      body: ListView.builder(
        itemCount: commands.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(commands[index].productName),
            subtitle: Text('Quantité: ${commands[index].quantity}, Client: ${commands[index].customerName}'),
            trailing: IconButton(
              icon: Icon(
                commands[index].processed ? Icons.check_circle : Icons.check_circle_outline,
                color: commands[index].processed ? Colors.green : null, // Change color to green when processed is true
              ),
              onPressed: () {
                setState(() {
                  // Toggle the processed flag when icon is pressed
                  commands[index].processed = !commands[index].processed;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Commande traitée pour ${commands[index].productName}'),
                ));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff00c7a1),
        onPressed: () {
          // Ajoutez ici le traitement pour le bouton flottant
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Pharmaprincipal()));
        },
        label: Text(
          'Terminer',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
