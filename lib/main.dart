import 'package:flutter/material.dart';
import 'package:my_app/Page1.dart';

void main() {
  runApp(const MyApp());
  //   const MaterialApp(
  //     home: Page1(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page1(),
    );
  }
}