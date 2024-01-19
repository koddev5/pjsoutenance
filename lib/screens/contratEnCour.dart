import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// class Item {
//   final int id;
//   final String name;
//   final String details;

//   Item({required this.id, required this.name, required this.details});
// }


// class contratEnCour extends StatefulWidget {
//   @override
//   _contratEnCourState createState() => _contratEnCourState();
// }

// class _contratEnCourState extends State<contratEnCour> {
//   late List<Item> itemList;
//   Item? selectedItem;

//   @override
//   void initState() {
//     super.initState();
//     itemList = [];
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('http://votre-api-endpoint.com/items')); // Remplacez par votre URL d'API

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);

//       setState(() {
//         itemList = data.map((item) {
//           return Item(
//             id: item['id'],
//             name: item['name'],
//             details: item['details'],
//           );
//         }).toList();
//       });
//     } else {
//       print('Erreur lors du chargement des données. Code de statut : ${response.statusCode}');
//       // Ajoutez ici la logique pour traiter les erreurs selon vos besoins
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Liste déroulante d\'éléments'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             DropdownButton<Item>(
//               value: selectedItem,
//               hint: Text('Sélectionnez un élément'),
//               onChanged: (Item? newValue) {
//                 setState(() {
//                   selectedItem = newValue;
//                 });
//               },
//               items: itemList.map((Item item) {
//                 return DropdownMenuItem<Item>(
//                   value: item,
//                   child: Text(item.name),
//                 );
//               }).toList(),
//             ),
//             if (selectedItem != null)
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('ID: ${selectedItem!.id}'),
//                     Text('Nom: ${selectedItem!.name}'),
//                     Text('Détails: ${selectedItem!.details}'),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Item {
  final int id;
  final String name;
  final String details;

  Item({required this.id, required this.name, required this.details});
}

class ContratEnCoursPage extends StatefulWidget {
  @override
  _ContratEnCoursPageState createState() => _ContratEnCoursPageState();
}

class _ContratEnCoursPageState extends State<ContratEnCoursPage> {
  late List<Item> itemList;
  Item? selectedItem;

  @override
  void initState() {
    super.initState();
    itemList = [
      Item(id: 1, name: 'CTC_BANQUE_POPULAIRE_ABATTA', details: 'Détails de l\'élément 1'),
      Item(id: 2, name: 'CTC_CGRAE', details: 'Détails de l\'élément 2'),
      Item(id: 3, name: 'CTC_SODECI_SONGON', details: 'Détails de l\'élément 3'),
      Item(id: 4, name: 'CTC_SIB', details: 'Détails de l\'élément 4'),
      Item(id: 5, name: 'CTC_TRESOR', details: 'Détails de l\'élément 5'),
      Item(id: 6, name: 'CTC_SODECI_HAUT_SERVICE', details: 'Détails de l\'élément 6'),
      Item(id: 7, name: 'CTC_BANQUE_POPULAIRE_BOUAKE', details: 'Détails de l\'élément 7'),
      Item(id: 8, name: 'CTC_BANQUE_POPULAIRE_DALOA', details: 'Détails de l\'élément 8'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des contrats en cours'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<Item>(
              value: selectedItem,
              hint: Text('Sélectionnez un élément'),
              onChanged: (Item? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              items: itemList.map((Item item) {
                return DropdownMenuItem<Item>(
                  value: item,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.details),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            if (selectedItem != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${selectedItem!.id}'),
                    Text('Nom: ${selectedItem!.name}'),
                    Text('Détails: ${selectedItem!.details}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
