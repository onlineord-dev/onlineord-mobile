import 'package:flutter/material.dart';

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