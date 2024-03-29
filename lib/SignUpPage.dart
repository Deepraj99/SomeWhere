import 'package:flutter/material.dart';
import 'package:somewhere/AppBar.dart';
import 'package:somewhere/colors.dart';
import 'MainWidget.dart';
import 'LogInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/firebase.dart';
import 'models/userModels.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password, _name, _location, _confirmPassword;

  TextEditingController email = new TextEditingController();
    TextEditingController password = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();


  bool _obscureText = true;
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
                      MediaQuery.of(context).size.height * 0.04)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: name,
                  onSaved: (val) => _name = val,
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
                      labelText: "Name",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Your Name",
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
                  controller: location,
                  onSaved: (val) => _location = val,
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
                      labelText: "Location",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Location",
                      hintStyle: TextStyle(
                        color: grey,
                      ),
                      icon: Icon(
                        Icons.pin_drop_outlined,
                        color: yellow,
                      )),
                  style: TextStyle(color: yellow),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: email,
                  onSaved: (val) => _email = val,
                  validator: (val) =>
                      !val.contains("@") ? "Invalid Email" : null,
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
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Valid Email",
                      hintStyle: TextStyle(
                        color: grey,
                      ),
                      icon: Icon(
                        Icons.mail,
                        color: yellow,
                      )),
                  style: TextStyle(color: yellow),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: password,
                  onSaved: (val) => _password = val,
                  validator: (val) =>
                      val.length < 6 ? "Password Is Too Short" : null,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: yellow,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: yellow,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      labelText: "Password",
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
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: confirmPassword,
                  onSaved: (val) => _confirmPassword = val,
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
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Password Again",
                      hintStyle: TextStyle(
                        color: grey,
                      ),
                      icon: Icon(
                        Icons.visibility,
                        color: yellow,
                      )),
                  style: TextStyle(color: yellow),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 60.0)),
              ButtonTheme(
                height: 60.0,
                minWidth: 320.0,
                child: RaisedButton(
                  onPressed: () async {

                    print(email.text);

                    UserCredential userNew = await Firebase().auth.createUserWithEmailAndPassword(email: email.text, password: password.text);

                    UserData userToAdded = UserData(name.text, location.text, email.text);

                    await Firebase().databaseReference.child(userNew.user.uid).set(userToAdded.toJson());

                  // print(Firebase().auth.currentUser.uid);

                  print("done");

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MainWidget()),
                    // );
                  },
                  color: yellow,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: voilet,
                      fontSize: 25,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              new OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                textColor: voilet,
                child: Text(
                  'Already have an Account? Log in',
                  style: TextStyle(
                    color: yellow,
                  ),
                ),
                borderSide: BorderSide(
                    color: yellow, style: BorderStyle.solid, width: 1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
