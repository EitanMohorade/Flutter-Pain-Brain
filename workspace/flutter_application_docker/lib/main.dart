import 'package:flutter/material.dart';
import 'navBar.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Material();
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: NavBar(title: appTitle),
    );
  }
}
