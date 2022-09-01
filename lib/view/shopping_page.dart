import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publish/controller/cartController.dart';
import 'package:publish/controller/shooping_control.dart';
import 'package:publish/view/homepage.dart';

import 'cartPage.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final shoppingcontroller = Get.put(ShoppingCcontroller());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart"),
        centerTitle: true,
        elevation: 0,
        actions: [
          GetX<CartController>(builder: (controller) {
            return GestureDetector(
              onTap: () {
                Get.to(CartPage());
              },
              child: Badge(
                badgeContent: Text(
                  controller.count.toString(),
                  style: TextStyle(color: Colors.red),
                ),
                child: Icon(Icons.shopping_bag),
                badgeColor: Colors.white,
                animationType: BadgeAnimationType.fade,
                position: BadgePosition.topStart(),
              ),
            );
          }),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingCcontroller>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.green.shade300,
                    margin: EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${controller.products[index].name}"),
                                  Text(
                                      " ${controller.products[index].category}"),
                                ],
                              ),
                              Text("\$${controller.products[index].price}"),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .removeToCart(controller.products[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text(
                                  "Remove to cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return controller.cartItems.isEmpty
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 70,
                        width: double.maxFinite,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Price:  \$${controller.totalPrice}",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(CartPage());
                                },
                                child: Text("Check Out"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
          }),
        ],
      ),
    );
  }
}
