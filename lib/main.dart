import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'QRScan_Page.dart';
import 'Home_Page.dart';
import 'Menu_Page.dart';
import 'Basket_Page.dart';
import 'LogIn_Page.dart';
import 'Registr_Page.dart';

class MyApp extends StatefulWidget {
  @override
  MainPage createState() => MainPage();
}


class MainPage extends State<MyApp> {
  int _currentIndex = 0;
  var _pages = [
    QRScan(),
    Home(),
    Menu(),
    Basket()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Main")),
      body: SafeArea(
        top: false,
        child: _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Scan',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Menu',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Basket',
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/LogIn',
    routes: {
      '/LogIn': (BuildContext context) => LogInPage(),
      '/LogIn/Registr': (BuildContext context) => RegistrPage(),
      '/Main': (BuildContext context) => MyApp(),
    },
  ));
}
