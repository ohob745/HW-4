
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'product.dart';

class ItemRow extends StatelessWidget {
  final Product product;

  const ItemRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 50, width: 50, child: Image.asset(product.image)),
        const SizedBox(width: 35),
        Text(
          product.name,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(width: 35),
        Text(
          product.price.toString(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }
}
