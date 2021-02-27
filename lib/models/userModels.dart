import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserData {
  String key;
  String name;
  String location;
  String email;

  UserData(this.name, this.location, this.email);

  UserData.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    name = snapshot.value["name"],
    location = snapshot.value["location"],
    email = snapshot.value["email"];

  Map<String,dynamic> toJson() {
    return {
      "name": name,
      "location": location,
      "email": email,
    };
  }
}