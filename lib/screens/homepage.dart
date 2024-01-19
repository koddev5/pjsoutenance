import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:pjenerteam/screens/contrat.dart';
// import 'package:pjenerteam/screens/contratEnCour.dart';
// import 'package:pjenerteam/screens/managementticket.dart';
import 'package:pjenerteam/screens/managementsite.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _navigateToSecondPageSite(BuildContext context) {
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SiteManagementScreen()),
 );
}
  void _navigateToSecondPageTicket(BuildContext context) {
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  TicketManagementScreen()),
 );
}

  void _navigateToSecondPagecontratEnCour(BuildContext context) {
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => contratE()),
 );
}

  

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Enerteam Maintenance app'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
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
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/logoen.jpg',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () => _navigateToSecondPageSite(context),
                  leading: Icon(Icons.house),
                  title: Text('site'),
                ),
                ListTile(
                  onTap: () => _navigateToSecondPageTicket(context),
                  leading: Icon(Icons.airlines_outlined),
                  title: Text('ticket de Maintenance'),
                ),
                ListTile(
                  onTap: () => _navigateToSecondPagecontratEnCour(context),
                  leading: Icon(Icons.assignment_outlined),
                  title: Text('contrat en cours'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Enerteam'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}


class Item {
 final int id;
 final String name;
 final String details;

 Item({required this.id, required this.name, required this.details});
}

final itemList = [
 Item(id: 1, name: 'ticket SIB', details: 'Cliquez pour voir l\'état du ticket'),
 Item(id: 2, name: 'ticket CGRAE', details: 'Cliquez pour voir l\'état du ticket'),
 Item(id: 3, name: 'ticek BP Daloa', details: 'Cliquez pour voir l\'état du ticket'),
 Item(id: 4, name: 'CTC_SIB', details: 'Cliquez pour voir l\'état du ticket'),
 Item(id: 5, name: 'ticket TRESOR', details: 'Cliquez pour voir l\'état du ticket'),
];