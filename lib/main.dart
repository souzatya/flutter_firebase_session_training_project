import 'package:flutter/material.dart';
import 'package:flutterfirebase/signin.dart';
import 'package:page_transition/page_transition.dart';
import './signup.dart';
import './signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Sign Up"),
              onPressed: (){
                Future.delayed(Duration(seconds: 1),(){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignUp()));
                });
              },
            ),
            RaisedButton(
              child: Text("Sign In"),
              onPressed: (){
                Future.delayed(Duration(seconds: 1),(){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignIn()));
                });
              },
            ),
          ],
        ),
      ),),
    );
  }
}
