import 'package:flutter/material.dart';
import 'package:somewhere/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:somewhere/colors.dart';
import 'models/userModels.dart';
import 'services/firebase.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  Future<Position> _determinePosition() async {

    await Permission.location.request().isGranted;

    bool serviceEnabled;
    LocationPermission permission;

    print("Map done");

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    print("location : " + Geolocator.getCurrentPosition().toString());
    return await Geolocator.getCurrentPosition();
  }

  GoogleMapController myController;

  UserData currentUser;

  LatLng _center = const LatLng(45.521563, -122.677433);

  String email = "", name = "", location = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    a() async {
      UserData current = await userDetails(currentUserID());

      setState(() {
        email = current.email;
        name = current.name;
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
        body: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {

              print("snapshot : ${snapshot.data}");

              Position data = snapshot.data;

             print(data.latitude);
            // center = ;
                           
              return GoogleMap(
                // onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(data.latitude, data.longitude),
                  zoom: 10.0,
                ),
              );
            }

            return CircularProgressIndicator();
          },
        ));
  }
}
