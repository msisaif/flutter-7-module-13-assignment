import 'package:flutter/material.dart';
import 'package:module_13_assignment/models/cart_item.dart';
import 'package:module_13_assignment/widgets/cart_item_widget.dart';
import 'package:module_13_assignment/widgets/checkout_button_widget.dart';
import 'package:module_13_assignment/widgets/total_amount_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Pullover',
      image: "https://i.ibb.co/WDy7xP0/black-t-shirt.png",
      color: 'Black',
      size: 'L',
      price: 51,
      quantity: 1,
    ),
    CartItem(
      name: 'T-Shirt',
      image: 'https://i.ibb.co/XV2cZfc/grey-t-shirt.png',
      color: 'Gray',
      size: 'L',
      price: 30,
      quantity: 1,
    ),
    CartItem(
      name: 'Sport Dress',
      image: 'https://i.ibb.co/JkpZQz7/flutter-t-shirt.png',
      color: 'Black',
      size: 'M',
      price: 43,
      quantity: 1,
    ),
  ];

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void updateQuantity(int index, int value) {
    setState(() {
      cartItems[index].quantity += value;
      if (cartItems[index].quantity < 1) {
        cartItems[index].quantity = 1;
      }
    });
  }

  void showCheckoutMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Congratulations! You have successfully checked out.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final cartItem = cartItems[index];
                  return CartItemWidget(
                    cartItem: cartItem,
                    onAdd: () => updateQuantity(index, 1),
                    onRemove: () => updateQuantity(index, -1),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TotalAmountWidget(totalAmount: totalAmount),
                const SizedBox(height: 12),
                CheckoutButtonWidget(onCheckout: showCheckoutMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
