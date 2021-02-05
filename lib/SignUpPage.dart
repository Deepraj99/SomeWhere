import 'package:flutter/material.dart';
import 'package:somewhere/colors.dart';
import 'MainWidget.dart';
import 'LogInPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password, _name, _userName, _confirmPassword;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/welcome.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.02)),
              Image(
                image: AssetImage("images/logo.png"),
                width: 300.0,
                height: 150.0,
              ),
              //Padding(padding: EdgeInsets.only(top: 200.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: yellow,
                        ),
                      ),
                      labelText: "Name",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Icon(
                        Icons.person,
                        color: yellow,
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  onSaved: (val) => _userName = val,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(
                          color: yellow,
                        ),
                      ),
                      labelText: "User ID",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter a valid user id",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Icon(
                        Icons.account_box,
                        color: yellow,
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  onSaved: (val) => _email = val,
                  validator: (val) =>
                      !val.contains("@") ? "Invalid Email" : null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Valid Email",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Icon(
                        Icons.mail,
                        color: yellow,
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
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
                          color: yellow,
                        ),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Valid Password",
                      hintStyle: TextStyle(
                        color: Colors.black,
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
                  onSaved: (val) => _confirmPassword = val,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: yellow,
                        ),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        color: yellow,
                      ),
                      hintText: "Enter Password Again",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      icon: Icon(
                        Icons.supervised_user_circle,
                        color: yellow,
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50.0)),
              ButtonTheme(
                height: 60.0,
                minWidth: 320.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainWidget()),
                    );
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
              // ButtonTheme(
              //   height: 60.0,
              //   minWidth: 320.0,
              //   child: RaisedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => LogInPage()),
              //       );
              //     },
              //     color: yellow,
              //     child: Text(
              //       'Already have an Account? Log in',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 15,
              //       ),
              //     ),
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(4.0)),
              //   ),
              // ),
              new OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                textColor: voilet,
                child: Text('Already have an Account? Log in'),
                borderSide: BorderSide(
                    color: yellow, style: BorderStyle.solid, width: 1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                  );
                },
              ),
              // Padding(padding: EdgeInsets.only(bottom: 30.0)),
            ],
          ),
        ),
      ),
    );
  }
}
