import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
    Get.snackbar(
      "Cart Info",
      "Product added",
      backgroundColor: Colors.teal.shade200,
      duration: Duration(seconds: 1),
      colorText: Colors.black,
    );
  }

  removeToCart(Product product) {
    cartItems.remove(product);
    Get.snackbar(
      "Cart Info",
      "Product removed",
      backgroundColor: Colors.teal.shade200,
      duration: Duration(seconds: 1),
      colorText: Colors.black,
    );
  }
}
