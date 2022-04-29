// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.id,
    this.name,
    this.email,
    this.age,
    this.password,
    this.confirmPassword,
  });

  int? id;
  String? name;
  String? email;
  String? age;
  String? password;
  String? confirmPassword;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "age": age,
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
