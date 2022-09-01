import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cartController.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Column(
        children: [
          Center(
            child: GetX<CartController>(builder: (controller) {
              return Text(controller.cartItems.length.toString());
            }),
          ),
        ],
      ),
    );
  }
}
