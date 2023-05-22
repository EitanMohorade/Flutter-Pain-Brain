import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../boton.dart';
import '../forma.dart';
import '../images.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.title});
  //NO FUNCIONA COMO QUERIA LA COSA
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: null,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: null,
            ),
            ListTile(
              title: const Text('Boton'),
              onTap: () {
                Navigator.of(context).push(_createRoute(const BotonLol()));
              },
            ),
            ListTile(
              title: const Text('Formas randoms'),
              onTap: () {
                Navigator.of(context).push(_createRoute(const Forma()));
              },
            ),
            ListTile(
              title: const Text('Imagenes'),
              onTap: () {
                Navigator.of(context).push(_createRoute(const ShowImages()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  final String title;

  const MyHomePageState({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePageState> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageState> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.cyanAccent,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'dar opacidad',
        child: const Icon(Icons.flip),
      ),
    );
  }
}

Route _createRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
  );
}
