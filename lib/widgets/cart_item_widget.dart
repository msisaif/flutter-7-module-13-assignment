import 'package:flutter/material.dart';
import 'package:module_13_assignment/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Image.network(
              cartItem.image,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 4,
                  right: 4,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Color: ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(cartItem.color),
                                const SizedBox(width: 8),
                                const Text(
                                  "Size: ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(cartItem.size),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.more_vert),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: cartItem.quantity <= 1 ? null : onRemove,
                          icon: const Icon(Icons.remove_circle_outline),
                          disabledColor: Colors.grey.shade400,
                        ),
                        Text(
                          cartItem.quantity.toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                        IconButton(
                          onPressed: onAdd,
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            right: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            "${(cartItem.price * cartItem.quantity).toStringAsFixed(0).toString()}\$",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
