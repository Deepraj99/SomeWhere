import 'package:flutter/material.dart';
import 'LogInPage.dart';
import 'SignUpPage.dart';
import 'SignUpPage.dart';
import 'MainWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tuple/tuple.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    // return MaterialApp(
    //   home:Text("hello"),
    // );


    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("Error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
      title: 'SomeWhere',
      debugShowCheckedModeBanner: false,
      home: LogInPage(),

      routes: <String,WidgetBuilder>{
        "/signInPage": (BuildContext context) => LogInPage(),
        "/signUpPage": (BuildContext context) => SignUpPage(),
        "/home":(BuildContext conext) => MainWidget(),
      },
    );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
