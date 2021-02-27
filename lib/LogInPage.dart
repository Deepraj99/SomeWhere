import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:SomeWhere/AppBar.dart';
import 'package:SomeWhere/SignUpPage.dart';
import 'MainWidget.dart';
import 'colors.dart';
import 'package:firebase_core/firebase_core.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkLogin() async{

    this._auth
  .authStateChanges()
  .listen((User user) {
    if (user == null) {

      print('User is currently signed out!');
    } else {
      
        Navigator.pushReplacementNamed(context,"/home");
    }
  });

  }
  String _userID, _email = 'devang@gmail.com', _password = '123456';

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      checkLogin();
    }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.12)),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  // onSaved: (val) => _email = val,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: yellow,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      labelText: "email",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter email",
                      hintStyle: TextStyle(
                        color: grey,
                      ),
                      icon: Icon(
                        Icons.people,
                        color: yellow,
                      )),
                  style: TextStyle(color: yellow),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  // onSaved: (val) => _password = val,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: yellow,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      labelText: "Enter Password",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: grey,
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: yellow,
                      )),
                  style: TextStyle(color: yellow),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 80.0)),
              ButtonTheme(
                height: 60.0,
                minWidth: 320.0,
                child: RaisedButton(
                  onPressed: () {

                    _auth.signInWithEmailAndPassword(email: _email, password: _password);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MainWidget()),
                    // );
                  },
                  color: yellow,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: voilet,
                      fontSize: 25,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 17,
                          color: yellow,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 17,
                          color: yellow,
                        ),
                      ),
                      onPressed: () {
                        // Forgot Password
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
