import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';
import 'product.dart';

class ItemCard extends StatelessWidget {
  final Product product;

  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //push the product detail screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product)));
      },
      child: Card(
        //set the color of the card
        color: Color.fromARGB(255, 200, 195, 195),
        child: Column(
          children: [
            Image.asset(product.image),
            Text(
              product.price.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              product.name,
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              product.brand,
              style: const TextStyle(
                  fontSize: 10, color: Color.fromRGBO(41, 41, 43, 1)),
            ),
          ],
        ),
      ),
    );
  }
} 