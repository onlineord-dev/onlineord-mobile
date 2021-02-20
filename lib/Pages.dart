import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'QRScan_Page.dart';


class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Логін або пошта',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value.isEmpty) {
                    /*code*/
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    /*code*/
                  }
                  return null;
                },
              ),
              Center(
                child:FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/LogIn/Registr');
                  },
                  child: Text(
                    "Немає аккаунту? Реєстрація.",
                  ),
                  textColor: Colors.lightBlue,
                ),
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.black
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Main');
                    },
                    child: Text("Вхід")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Пошта',
                    ),
                    keyboardType: TextInputType.emailAddress ,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        /*code*/
                      }
                      return null;
                    }
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ім’я',
                  ),
                  keyboardType: TextInputType.text ,
                  textInputAction: TextInputAction.next,
                  validator:(value) {
                    if (value.isEmpty) {
                      /*code*/
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Прізвище',
                  ),
                  textInputAction: TextInputAction.next,
                  validator:(value) {
                    if (value.isEmpty) {
                      /*code*/
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Номер телефону',
                    prefixText: '+38',
                  ),
                  keyboardType: TextInputType.phone ,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      /*code*/
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                  ),
                  keyboardType: TextInputType.text ,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      /*code*/
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Підтвердіть пароль',
                  ),
                  keyboardType: TextInputType.text ,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      /*code*/
                    }
                    return null;
                  },
                ),
                Center(
                  child:FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/LogIn');
                    },
                    child: Text(
                      "Вже зареєстровані? Увійти.",
                    ),
                    textColor: Colors.lightBlue,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.black
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Main');
                      },
                      child: Text("Створити аккаунт")),
                ),
              ]
          ),
        ),
      ),
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  MainPage createState() => MainPage();
}


class MainPage extends State<MyApp> {
  int _currentIndex = 0;
  var _pages = [
    QRScan(),
    Text('Домашня'),
    Text('Меню'),
    Text('Корзина')
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
