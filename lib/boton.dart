import 'package:flutter/material.dart';
import 'package:my_app/functions/example.dart';

class BotonLol extends StatelessWidget {
  const BotonLol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //body: Image.network(
      //  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
      //),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.tour),
            title: const Text('Zonas turisticas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Example()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
            title: const Text('Algo mas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Example()),
              );
            },
          ),
        ],
      ),
    );
  }
}

Route _createRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
