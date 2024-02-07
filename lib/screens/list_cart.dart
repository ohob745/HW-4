import 'package:flutter/material.dart';
import '../models/product.dart';

class ListCart extends StatefulWidget {
  final List<Product> cartItems;

  const ListCart({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<ListCart> createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice =
        widget.cartItems.fold(0, (sum, product) => sum + product.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(81, 85, 97, 1),
        title: const Text('Shopping Cart',
            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color:
              Color.fromRGBO(81, 85, 97, 1), // Set the background color to blue
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  return ItemRow(product: widget.cartItems[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding:
                  const EdgeInsets.fromLTRB(70, 5, 70, 5), // Adjust padding as needed
              decoration: BoxDecoration(
                color: const Color.fromRGBO(226, 206, 182, 1),
                // Set container decoration if needed
                border: Border.all(
                    color: const Color.fromRGBO(226, 206, 182, 1)), // Example border
                borderRadius:
                    BorderRadius.circular(20), // Example border radius
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    decorationColor: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 15,
                  ),
                ),
                child: const Text("next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
