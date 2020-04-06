import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _passc = new TextEditingController();

  dynamic user = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _name,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.pinkAccent[200]),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.pinkAccent[200]),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.pinkAccent[200]),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passc,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.pinkAccent[200]),
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text("SignUp"),
              onPressed: () async {
                if(_pass.text==_passc.text) {
                  user = await _auth.signUp(_name.text, _email.text, _pass.text);
                }
                if (user != null) {
                  // signed in
                  Future.delayed(Duration(seconds: 2),(){
                    Navigator.pop(context);
                  });
                }
                else {
                  Fluttertoast.showToast(
                    msg: "Registration not valid!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
            ),
          ],
        ),
      ),),
    );
  }
}
