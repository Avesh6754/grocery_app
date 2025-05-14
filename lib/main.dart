import 'package:flutter/material.dart';
import 'package:grocery_app/views/component/bottom_app_bar.dart';
import 'package:grocery_app/views/home_screen.dart';

void main() => runApp(GroceryApp());

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      home: MainPage(),
    );
  }
}




