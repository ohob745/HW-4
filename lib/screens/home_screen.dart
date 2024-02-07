import 'package:flutter/material.dart';

import '../data/product_list.dart';
import '../models/item_caed.dart';
import 'list_cart.dart';

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
                                ItemCard(
                                  product: product6,
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