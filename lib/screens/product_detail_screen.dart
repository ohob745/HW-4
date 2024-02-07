import 'package:flutter/material.dart';
import '../data/product_list.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Color iconColor = Colors.grey; // Initial color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.product.image),
              Text(
                widget.product.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star),
                  Text(
                    widget.product.price.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "About the product",
                style: TextStyle(
                    fontSize: 17, color: Color.fromRGBO(41, 41, 43, 1)),
              ),
              const SizedBox(height: 10),
              const Text(
                "As part of our efforts to reach carbon neutrality by 2030,Included in the box is a USB‑C to Lightning Cable that supports fast charging and is compatible with USB‑C power adapters and computer ports."
                ,style: TextStyle(
                    fontSize: 10, color: Color.fromRGBO(41, 41, 43, 1)),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_sharp),
                    onPressed: () {
                      // Toggle between gray and red colors on each tap
                      setState(() {
                        iconColor = (iconColor == Colors.grey)
                            ? Colors.red
                            : Colors.grey;
                      });
                    },
                    color: iconColor,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                        45, 5, 45, 5), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(226, 206, 182, 1),
                      // Set container decoration if needed
                      border: Border.all(
                          color: const Color.fromRGBO(
                              226, 206, 182, 1)), // Example border
                      borderRadius:
                          BorderRadius.circular(20), // Example border radius
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add your logic to pass data to another screen
                        // For demonstration, let's print the product details here
                        productList.add(widget.product);
                        print('Added to cart: ${widget.product.name}');
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          decorationColor: Color.fromRGBO(226, 206, 182, 1),
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("Add to Cart"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
