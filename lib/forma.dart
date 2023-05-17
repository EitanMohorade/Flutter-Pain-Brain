import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/layouts/navBar.dart';

class Forma extends StatelessWidget {
  const Forma({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: NavBar(
        title: 'Forma',
        cosa: Scaffold(
          
          appBar: AppBar(),
          body: const Center(
            child: AnimatedContainerApp(),
          ),
        ),
      ),
    );
  }
}

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.deepPurple;
  BorderRadiusGeometry _boorderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _width,
      height: _heigth,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: _boorderRadius,
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
       child: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _heigth = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
            _boorderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
