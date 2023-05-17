import 'package:flutter/material.dart';
import 'package:my_app/layouts/navBar.dart';


class ShowImages extends StatelessWidget {
  const ShowImages({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(
        title: 'Imagene',
        cosa: Scaffold(
          appBar: AppBar(
            title: const Text('title'),
          ),
          body: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
    );
  }
}