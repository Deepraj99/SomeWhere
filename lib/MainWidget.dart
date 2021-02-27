import 'package:flutter/material.dart';
import 'package:SomeWhere/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'models/userModels.dart';
import 'services/firebase.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  UserData currentUser;

  String email = "",name = "", location = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Deepak"),
              accountEmail: Text("abcd@gamil.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("DP"),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text("Category"),
              trailing: Icon(Icons.ac_unit),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.more),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            Divider(),
            ListTile(
              title: Text("Mascot"),
              trailing: Icon(Icons.home),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(email),

            Text("Name = ${name}"),
            Text("Email = ${email}"),
            Text("My location = ${location}"),
            Text("My Friends"),
            RaisedButton(
                child: Text("update data"),
                onPressed: () async {
                  UserData current = await userDetails(currentUserID());

                  setState(() {
                    email = current.email;
                    name =  current.name;
                    location = current.location;
                  });
                }),
            RaisedButton(
                child: Text("add data"),
                onPressed: () async {
                  UserData user1 = UserData("Deepak", "7877", "deepak@gmail.com");

                  await Firebase().databaseReference.child(currentUserID()).set(user1.toJson());

                  print(Firebase().auth.currentUser.uid);

                  print("done");
                }),
            RaisedButton(
                child: Text("Logout"),
                onPressed: () {
                  Firebase().auth.signOut();
                  Navigator.pushReplacementNamed(context, "/signInPage");
                }),
          ],
        ),
      ),
    );
  }
}
