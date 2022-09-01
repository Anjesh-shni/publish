import 'package:get/get.dart';
import '../model/product_model.dart';

class ShoppingCcontroller extends GetxController {
  // product list
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  fetchProduct() async {
    await Future.delayed(Duration(seconds: 2));
    var ProductResult = [
      Product(id: 1, name: "Apple", category: "Fruits", price: 100),
      Product(id: 2, name: "banana", category: "Fruits", price: 120),
      Product(id: 3, name: "mango", category: "Fruits", price: 80),
      Product(id: 4, name: "butter", category: "Fruits", price: 160),
      Product(id: 1, name: "Apple", category: "Fruits", price: 100),
      Product(id: 2, name: "banana", category: "Fruits", price: 120),
      Product(id: 3, name: "mango", category: "Fruits", price: 80),
      Product(id: 4, name: "butter", category: "Fruits", price: 160),
      Product(id: 1, name: "Apple", category: "Fruits", price: 100),
      Product(id: 2, name: "banana", category: "Fruits", price: 120),
      Product(id: 3, name: "mango", category: "Fruits", price: 80),
      Product(id: 4, name: "butter", category: "Fruits", price: 160),
      Product(id: 1, name: "Apple", category: "Fruits", price: 100),
      Product(id: 2, name: "banana", category: "Fruits", price: 120),
      Product(id: 3, name: "mango", category: "Fruits", price: 80),
      Product(id: 4, name: "butter", category: "Fruits", price: 160),
    ];
    products.value = ProductResult;
  }
}
