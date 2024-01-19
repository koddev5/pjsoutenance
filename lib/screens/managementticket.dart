import 'dart:convert';

import 'package:flutter/material.dart';

class Ticket {
}
class TicketManagementScreen extends StatelessWidget {
   final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Gestion des Sites'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 50,),
                CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 175, 157, 76),
            radius: 115,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 246, 245, 185),
              radius: 110,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/llg.png'),
                radius: 100,
              ), //CircleAvatar
            ), //CircleAvatar
          ),

                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      // Ajoutez la navigation vers la page correspondante
                    },
                    child: Text('creer un ticket de maintenance'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ajoutez la navigation vers la page correspondante
                    },
                    child: Text('afficher les ticket de maintenance'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      // Ajoutez la navigation vers la page correspondante
                    },
                    child: Text('Afficher un Tickets de Maintenance'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
 }
}