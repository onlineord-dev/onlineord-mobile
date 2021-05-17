import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/Pages.dart';
import 'package:flutter_application_1/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';








class LogInPage extends StatefulWidget {

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();


  bool _isLoading = true;
  signIn(String email,String password) async {
    String url = "https://onlineord.herokuapp.com/users/";
    Map data = {
      'email': email,
      'password': password
    };
    var jsonData ;


    var response = await http.post(url, body: data);

    if(response.statusCode == 200){
      jsonData = json.decode(response.body);
      print("Response status: ${response.statusCode}");

      print("Response status: ${response.body}");

      if(jsonData != null && jsonData[0].keys.toString() != "(error)"){
        setState((){
          _isLoading = true;
        });

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false);
      }
    } else {
      setState((){
        _isLoading = false;

      });

      print("Response status: ${response.body}");

    }
  }

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
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Логін або пошта',
                ),
                textInputAction: TextInputAction.next,
                // validator: (value) {
                //   if () {
                //     //
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Пароль',
                ),
                obscureText: true,
                // validator: (value) {
                //   if () {
                //
                //   }
                //   return null;
                // },
              ),
              Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Немає аккаунту?",
                    ),
                    new MaterialButton(
                      minWidth: 0,
                      height: 0,
                      padding: EdgeInsets.all(3),
                      onPressed: () {
                        Navigator.pushNamed(context, '/LogIn/Registr');
                      },
                      child: Text(
                        "Реєстрація.",
                      ),
                      textColor: Colors.lightBlue,
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.black),

                      onPressed : () {
                      // Navigator.pushNamed(context, '/Main');
                      setState(() { _isLoading = true;});
                      signIn(emailController.text, passwordController.text);
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








