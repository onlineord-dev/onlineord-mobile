import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.email,
    this.name,
    this.surname,
    this.phone_number,
    this.password,
  });

  String email;
  String name;
  String surname;
  String phone_number;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    name: json["name"],
    surname: json["surname"],
    phone_number: json["phone_number"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "surname": surname,
    "phone_number": phone_number,
    "password": password,
  };
}