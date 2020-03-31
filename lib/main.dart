import 'package:flutter/material.dart';
import 'package:quiqle_app/Screens/signin_screen.dart';
import 'package:quiqle_app/Screens/signUpScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiqle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
    );
  }
}
