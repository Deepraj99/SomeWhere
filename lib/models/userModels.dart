import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserData {
  String key;
  String name;
  int number;
  String email;

  UserData(this.name, this.number, this.email);

  UserData.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    name = snapshot.value["name"],
    number = snapshot.value["number"],
    email = snapshot.value["email"];

  Map<String,dynamic> toJson() {
    return {
      "name": name,
      "number": number,
      "email": email,
    };
  }
}