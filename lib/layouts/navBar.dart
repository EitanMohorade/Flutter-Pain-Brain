import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../boton.dart';
import '../forma.dart';
import '../images.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.title, required this.cosa});
  //NO FUNCIONA COMO QUERIA LA COSA
  final String title;
  final Scaffold cosa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      backgroundColor: Colors.amberAccent,
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
              onLongPress: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=> const PageOne()),
                );
              },
            ),
            ListTile(
              title: const Text('Formas randoms'),
              onLongPress: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=> const Forma()),
                );
              },
            ),
            ListTile(
              title: const Text('Imagenes'),
              onLongPress: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=> const ShowImages()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
