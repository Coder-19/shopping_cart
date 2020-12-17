import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/home_screen.dart';
// import 'package:shopping_cart/screens/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shopping cart',
      // home: SecondScreen(),
      home: HomeScreen(),
    );
  }
}
