import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Todo {
  String key;
  String name;
  bool number;
  String email;

  Todo(this.name, this.number, this.email);

  Todo.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    name = snapshot.value["name"],
    number = snapshot.value["number"],
    email = snapshot.value["email"];

  toJson() {
    return {
      "name": name,
      "number": number,
      "email": email,
    };
  }
}