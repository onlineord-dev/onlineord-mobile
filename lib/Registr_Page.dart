import 'package:flutter/material.dart';

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