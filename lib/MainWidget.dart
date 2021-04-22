import 'package:flutter/material.dart';
import 'package:somewhere/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';  
import 'package:somewhere/colors.dart';
import 'models/userModels.dart';
import 'services/firebase.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  GoogleMapController myController;  

  UserData currentUser;

final LatLng _center = const LatLng(45.521563, -122.677433);  

  String email = "",name = "", location = "";

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      a() async {
               UserData current = await userDetails(currentUserID());

                      setState(() {
                    email = current.email;
                    name =  current.name;
                    location = current.location;
                  });
      }

      a();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: kvoilet),
              accountName: Text("Deepak"),
              accountEmail: Text("abcd@gamil.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
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
              title: Text("Logout"),
              trailing: Icon(Icons.logout),
              onTap: () {
                  Firebase().auth.signOut();
                  Navigator.pushReplacementNamed(context, "/signInPage");
                }),
            
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: GoogleMap(  
              // onMapCreated: _onMapCreated,  
              initialCameraPosition: CameraPosition(  
                target: _center,  
                zoom: 10.0,  
              ),  
            ),  
      
      // Center(

      //   child: Text("hello"),
        // child: Column(
        //   children: [
        //     Text(email),

        //     Text("Name = ${name}"),
        //     Text("Email = ${email}"),
        //     Text("My location = ${location}"),
        //     Text("My Friends"),
        //     RaisedButton(
        //         child: Text("update data"),
        //         onPressed: () async {
        //           UserData current = await userDetails(currentUserID());

        //           setState(() {
        //             email = current.email;
        //             name =  current.name;
        //             location = current.location;
        //           });
        //         }),
        //     RaisedButton(
        //         child: Text("add data"),
        //         onPressed: () async {
        //           UserData user1 = UserData("Deepak", "7877", "deepak@gmail.com");

        //           await Firebase().databaseReference.child(currentUserID()).set(user1.toJson());

        //           print(Firebase().auth.currentUser.uid);

        //           print("done");
        //         }),
        //     RaisedButton(
        //         child: Text("Logout"),
        //         onPressed: () {
        //           Firebase().auth.signOut();
        //           Navigator.pushReplacementNamed(context, "/signInPage");
        //         }),
        //   ],
        // ),
      // ),
    );
  }
}
