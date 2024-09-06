import 'package:flutter/material.dart';

class CheckoutButtonWidget extends StatelessWidget {
  final VoidCallback onCheckout;

  const CheckoutButtonWidget({
    super.key,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onCheckout,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Text(
          'CHECK OUT',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
