import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/Pages.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';


class RegistrPage extends StatefulWidget {

  @override
  _RegistrPageState createState() => _RegistrPageState();
}

class _RegistrPageState extends State<RegistrPage> {

  UserModel _user;

  TextEditingController emailController =  TextEditingController();
  TextEditingController nameController =  TextEditingController();
  TextEditingController surnameController =  TextEditingController();
  TextEditingController phone_numberController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();

  Future<UserModel> createUser(String email, String name, String surname, String phone_number, String password) async{
    final String apiUrl = "https://onlineord.herokuapp.com/users/new";

    final response = await http.post(apiUrl, body:{
      "email": email,
      "name": name,
      "surname": surname,
      "phone_number": phone_number,
      "password": password
    });

    if (response.statusCode == 200){
      final String responseString = response.body;
      Navigator.pushNamed(context, '/LogIn');
      return userModelFromJson(responseString);
    }else{
      return null;
    }


  }


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
                  controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Пошта',
                    ),
                    keyboardType: TextInputType.emailAddress ,
                    textInputAction: TextInputAction.next,
                    //validator: (value) {
                    //  if (value.isEmpty) {
                    //    /*code*/
                    //  }
                    // return null;
                    //}
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Ім’я',
                  ),
                  keyboardType: TextInputType.text ,
                  textInputAction: TextInputAction.next,
                  //validator:(value) {
                  // if (value.isEmpty) {
                      /*code*/
                   // }
                  //return null;
                  //},
                ),
                TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(
                    labelText: 'Прізвище',
                  ),
                  textInputAction: TextInputAction.next,
                  //validator:(value) {
                  //  if (value.isEmpty) {
                  //    /*code*/
                  //  }
                  //  return null;
                  //},
                ),
                TextFormField(
                  controller: phone_numberController,
                  decoration: const InputDecoration(
                    labelText: 'Номер телефону',
                    prefixText: '+38',
                  ),
                  keyboardType: TextInputType.phone ,
                  textInputAction: TextInputAction.next,
                  //validator: (value) {
                  //  if (value.isEmpty) {
                  //    /*code*/
                  //  }
                  //  return null;
                  //},
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                  ),
                  keyboardType: TextInputType.text ,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  //validator: (value) {
                  //  if (value.isEmpty) {
                  //    /*code*/
                  //  }
                  //  return null;
                  //},
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Підтвердіть пароль',
                  ),
                  keyboardType: TextInputType.text ,
                  obscureText: true,
                  //validator: (value) {
                  //  if (value.isEmpty) {
                  //    /*code*/
                  //  }
                  //  return null;
                  //},
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Вже зареєстровані?",
                      ),
                      MaterialButton(
                        minWidth: 0,
                        height: 0,
                        padding: EdgeInsets.all(3),
                        onPressed: () {
                          Navigator.pushNamed(context, '/LogIn');
                        },
                        child: Text(
                          "Увійти.",
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
                          onPrimary: Colors.black
                      ),
                      onPressed: () async {
                        //Navigator.pushNamed(context, '/Main');
                        final String email = emailController.text;
                        final String name = nameController.text;
                        final String surname = surnameController.text;
                        final String phone_number = phone_numberController.text;
                        final String password = passwordController.text;

                        final UserModel user = await createUser(email, name, surname, phone_number, password);

                        setState(() {
                          _user = user;
                        });
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
