import 'package:flutter/material.dart';
import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';
import 'package:flutter_onboarding_with_scopedmodel/screens/home/homepage.dart';
import 'package:flutter_onboarding_with_scopedmodel/screens/login/login.dart';
import 'package:flutter_onboarding_with_scopedmodel/screens/signup/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        // Default font family.
        fontFamily: 'San Francisco',

        //Default Font Style
        textTheme: TextTheme(
          display2: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold, color: Colors.black),
          button: TextStyle(fontSize: 18.0, color: Colors.white)
        ),
      ),
      home: Login(),

      routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) => Login(),
      '/signup': (BuildContext context) => Signup(),
      '/home': (BuildContext context) => HomePage(),
      },

    );
  }
}