import 'package:flutter/material.dart';
import 'package:foodApp/screens/Cart.dart';
import 'package:foodApp/screens/RestaurantScreen.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(primaryColor: Colors.orange[800]),
      routes: {
        '/': (context) => HomeScreen(),
        '/restaurant': (context) => RestaurantScreen(),
        '/cart': (ctx) => CartScreen(),
      },
    );
  }
}
