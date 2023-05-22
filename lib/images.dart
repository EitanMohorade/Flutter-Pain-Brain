import 'package:flutter/material.dart';

class ShowImages extends StatelessWidget {
  const ShowImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagenes con opacidad'),
      ),
      body: const Center(
        child: OpacityMode(),
      ),
    );
  }
}

class OpacityMode extends StatefulWidget {
  const OpacityMode({super.key});

  @override
  State<OpacityMode> createState() => _OpacityModeState();
}

class _OpacityModeState extends State<OpacityMode> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //child: Image.network('https://picsum.photos/250?image=9'),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Opacidad',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
