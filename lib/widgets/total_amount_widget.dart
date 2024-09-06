import 'package:flutter/material.dart';

class TotalAmountWidget extends StatelessWidget {
  final double totalAmount;

  const TotalAmountWidget({
    super.key,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Total amount:'),
        const Spacer(),
        Text(
          '${totalAmount.toStringAsFixed(0)}\$',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
