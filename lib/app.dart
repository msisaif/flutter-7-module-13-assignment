import 'package:flutter/material.dart';
import 'package:module_13_assignment/screens/cart_screen.dart';

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cart App',
      home: CartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
