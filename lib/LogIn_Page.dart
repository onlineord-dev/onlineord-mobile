import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/Pages.dart';
import 'package:flutter_application_1/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';


TextEditingController EmailController = new TextEditingController();
TextEditingController PasswordController = new TextEditingController();





class LogInPage extends StatefulWidget {

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  bool _isLoading = false;
  signIn(String Email,String Password) async {
    Map data = {
      'Email': Email,
      'Password': Password
    };
    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post('https://cdn.jsdelivr.net/gh/onlineord-dev/onlineord-server/mock/users.json', body: data);
    if(response.statusCode == 200){
      jsonData = json.decode(response.body);
      setState((){
        _isLoading = false;
        sharedPreferences.setString("token", jsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false);
      });
    }
    else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: EmailController,
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
                controller: PasswordController,
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
                      // Navigator.pushNamed(context, '/Main');
                      setState(() {
                        _isLoading = true;
                      });
                      signIn(EmailController.text, PasswordController.text);

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








