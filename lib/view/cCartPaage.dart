import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartPaage extends StatelessWidget {
  const CartPaage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("cart"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [Text("Wow get data")],
        ),
      ),
    );
  }
}
