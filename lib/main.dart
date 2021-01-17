import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.pink,
      ),
      home: Homepage(),
    );
  }
}
