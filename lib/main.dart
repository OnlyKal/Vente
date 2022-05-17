import 'package:flutter/material.dart';
import './export.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/dashboard': (context) => const DashBoard(),
      '/': ((context) => const MainForm())
    },
    home: null,
  ));
}

class MainForm extends StatefulWidget {
  const MainForm({Key? key}) : super(key: key);

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  int selectedIndexPage = 0;

  void onChangePage(index) => setState(() => {selectedIndexPage = index});

  static const List<Widget> _pages = <Widget>[
    DashBoard(),
    Products(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Atlog POS',
            )),
        drawer: drawerMenu(context),
        body: IndexedStack(
          index: selectedIndexPage,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          unselectedItemColor: Colors.white,
          iconSize: 25,
          selectedItemColor: const Color.fromARGB(255, 111, 220, 245),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize_rounded),
                label: 'Table de bord'),
            BottomNavigationBarItem(
                icon: Icon(Icons.gpp_good_rounded), label: 'Produits'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Paramètres'),
          ],
          currentIndex: selectedIndexPage,
          onTap: onChangePage,
        ));
  }
}
