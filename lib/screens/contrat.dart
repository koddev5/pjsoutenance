import 'package:flutter/material.dart';


class contratE extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Contrat en cour'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                 title: Text(itemList[index].name),
                 subtitle: Text(itemList[index].details),
                ),
                Divider(thickness: 1),
              ],
            );
          },
        ),
      ),
    );
 }
}

class Item {
 final int id;
 final String name;
 final String details;

 Item({required this.id, required this.name, required this.details});
}

final itemList = [
 Item(id: 1, name: 'CTC_BANQUE_POPULAIRE_ABATTA', details: 'Contrat en cour Banque populaire ABATTA'),
 Item(id: 2, name: 'CTC_CGRAE', details: 'Contrat en cour CGRAE'),
 Item(id: 3, name: 'CTC_SODECI_SONGON', details: 'Contrat en cour SONGON'),
 Item(id: 4, name: 'CTC_SIB', details: 'Contrat en cour SIB'),
 Item(id: 5, name: 'CTC_TRESOR', details: 'Contrat en cour TRESOR'),
 Item(id: 6, name: 'CTC_SODECI_HAUT_SERVICE', details: 'Contrat en cour SODECI site haut service'),
 Item(id: 7, name: 'CTC_BANQUE_POPULAIRE_BOUAKE', details: 'Contrat en cour Banque populaire Bouaké'),
 Item(id: 8, name: 'CTC_BANQUE_POPULAIRE_DALOA', details: 'Contrat en cour Banque populaire Daloa'),
];