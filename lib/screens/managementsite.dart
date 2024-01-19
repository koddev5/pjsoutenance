import 'dart:convert';

import 'package:flutter/material.dart';

class Site {
  String nom;
  String localisation;
  String etat;
  String contratMaintenance;
  int nbMaintenancesEffectuees;
  DateTime dateFinTravaux;
  DateTime dateProchaineMaintenance;
  DateTime dateFinGarantie;

  Site({
    required this.nom,
    required this.localisation,
    required this.etat,
    required this.contratMaintenance,
    required this.nbMaintenancesEffectuees,
    required this.dateFinTravaux,
    required this.dateProchaineMaintenance,
    required this.dateFinGarantie,
  });

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'localisation': localisation,
      'etat': etat,
      'contratMaintenance': contratMaintenance,
      'nbMaintenancesEffectuees': nbMaintenancesEffectuees,
      'dateFinTravaux': dateFinTravaux.toIso8601String(),
      'dateProchaineMaintenance': dateProchaineMaintenance.toIso8601String(),
      'dateFinGarantie': dateFinGarantie.toIso8601String(),
    };
  }
}
class SiteManagementScreen extends StatelessWidget {
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
               
                radius: 150,
              ), //CircleAvatar
            ), //CircleAvatar
          ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                       context,
                       MaterialPageRoute(
                          builder: (context) => CreateSiteScreen(),
                       ),
                      );
                    },
                    child: Text('Créer un Site'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                       context,
                       MaterialPageRoute(
                          builder: (context) => DisplaySitesScreen(),
                       ),
                      );
                    },
                    child: Text('Afficher les Sites'),
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
                    child: Text('Supprimer un Site'),
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
                    child: Text('Afficher les Contrats de Maintenance'),
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
                    child: Text('Afficher les Tickets de Maintenance'),
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

class CreateSiteScreen extends StatefulWidget {
  @override
  _CreateSiteScreenState createState() => _CreateSiteScreenState();
}


class _CreateSiteScreenState extends State<CreateSiteScreen> {
  late TextEditingController nomController;
  late TextEditingController localisationController;
  late TextEditingController etatController;
  late TextEditingController contratMaintenanceController;
  late TextEditingController nbMaintenancesEffectueesController;
  late TextEditingController dateFinTravauxController;
  late TextEditingController dateProchaineMaintenanceController;
  late TextEditingController dateFinGarantieController;

  @override
  void initState() {
    super.initState();
    nomController = TextEditingController();
    localisationController = TextEditingController();
    etatController = TextEditingController();
    contratMaintenanceController = TextEditingController();
    nbMaintenancesEffectueesController = TextEditingController();
    dateFinTravauxController = TextEditingController();
    dateProchaineMaintenanceController = TextEditingController();
    dateFinGarantieController = TextEditingController();
  }

  @override
  void dispose() {
    nomController.dispose();
    localisationController.dispose();
    etatController.dispose();
    contratMaintenanceController.dispose();
    nbMaintenancesEffectueesController.dispose();
    dateFinTravauxController.dispose();
    dateProchaineMaintenanceController.dispose();
    dateFinGarantieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un Site'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nomController,
              decoration: InputDecoration(labelText: 'Nom du Site'),
            ),
            TextField(
              controller: localisationController,
              decoration: InputDecoration(labelText: 'Localisation'),
            ),
            TextField(
              controller: etatController,
              decoration: InputDecoration(labelText: 'État du Site'),
            ),
            TextField(
              controller: contratMaintenanceController,
              decoration: InputDecoration(labelText: 'Contrat de Maintenance'),
            ),
            TextField(
              controller: nbMaintenancesEffectueesController,
              decoration: InputDecoration(labelText: 'Nombre de Maintenances Effectuées'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dateFinTravauxController,
              decoration: InputDecoration(labelText: 'Date de Fin des Travaux (YYYY-MM-DD)'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: dateProchaineMaintenanceController,
              decoration: InputDecoration(labelText: 'Date de la Prochaine Maintenance (YYYY-MM-DD)'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: dateFinGarantieController,
              decoration: InputDecoration(labelText: 'Date de Fin de la Garantie (YYYY-MM-DD)'),
              keyboardType: TextInputType.datetime,
            ),
            ElevatedButton(
              onPressed: () {
                // Convertir les données en format JSON
                Map<String, dynamic> siteData = {
                  'nom': nomController.text,
                  'localisation': localisationController.text,
                  'etat': etatController.text,
                  'contratMaintenance': contratMaintenanceController.text,
                  'nbMaintenancesEffectuees': int.parse(nbMaintenancesEffectueesController.text),
                  'dateFinTravaux': dateFinTravauxController.text,
                  'dateProchaineMaintenance': dateProchaineMaintenanceController.text,
                  'dateFinGarantie': dateFinGarantieController.text,
                };

                // Convertir en JSON
                String jsonData = json.encode(siteData);
                print(jsonData);

                // Enregistrez les données sur votre endpoint
                // (Ajoutez votre logique d'appel d'API ici)

                // Retour à l'écran de gestion des sites
                Navigator.pop(context);
              },
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}



class DisplaySitesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ajoutez ici la logique pour afficher la liste des sites
    return Scaffold(
      appBar: AppBar(
        title: Text('Afficher les Sites'),
      ),
      body: Center(
        child: Text('Liste des Sites'),
      ),
    );
  }
}

// Créez les autres classes pour les fonctionnalités restantes (Supprimer un Site,
// Afficher les Contrats de Maintenance, Afficher les Tickets de Maintenance) de manière similaire.

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
                radius: 150,
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

