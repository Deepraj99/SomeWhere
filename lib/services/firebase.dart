import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/userModels.dart';


class Firebase {
  final FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
}




  Future<UserData> userDetails(String name) async {
 
  DataSnapshot data =  await Firebase().databaseReference.child(name).once();

    return UserData.fromSnapshot(data);

  }

  String currentUserID() {
             
             return Firebase().auth.currentUser.uid;
    }