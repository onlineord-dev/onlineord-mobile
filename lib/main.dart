import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Center(
          child: Row(
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Main');
                  },
                  child: Text("Log In")),
              RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/LogIn/Registr');
                  },
                  child: Text("Registration")),
            ],
          )),
    );
  }
}

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("QR Scan")),
        body: Center(
          child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Main');
              },
              child: Text("Scan")),
        ));
  }
}

class RegistrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registration")),
        body: Center(
          child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Main');
              },
              child: Text("Log In")),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  MainPage createState() => MainPage();
}

class MainPage extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Main")),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),label: 'Scan', backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),label: 'Menu', backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: 'Basket',backgroundColor: Colors.blue),
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
      '/QRScan': (BuildContext context) => QRCodePage(),
      '/LogIn/Registr': (BuildContext context) => RegistrPage(),
      '/Main': (BuildContext context) => MyApp(),
    },
  ));
}
