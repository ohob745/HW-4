import 'package:flutter/material.dart';

import '../data/product_list.dart';
import '../models/product.dart';
import 'list_cart.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(246, 181, 181, 189),
        actions: [
          IconButton(
            //align the icon to the bottom left
            alignment: Alignment.bottomLeft,
            onPressed: () {
              //push the list cart screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListCart(
                            cartItems: productList,
                          )));
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  //set the color of the container
                  color: Color.fromARGB(246, 197, 197, 202),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ItemCard(
                                  product: product1,
                                ),
                                ItemCard(
                                  product: product2,
                                ),
                                ItemCard(
                                  product: product3,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                ItemCard(
                                  product: product4,
                                ),
                                ItemCard(
                                  product: product5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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