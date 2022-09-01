import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'posy',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: MyWidget());
  }
}
