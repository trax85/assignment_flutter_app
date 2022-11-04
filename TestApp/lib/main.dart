import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key:key);

  @override
  Widget build(BuildContext context) {
    //We use GetMaterialApp instead of MaterialApp to use Getx controllers.
    return const GetMaterialApp(
      home: SigninPage(),
    );
  }
}
