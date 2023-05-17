import 'package:flutter/material.dart';
import 'package:my_app/forma.dart';
import 'package:my_app/layouts/navBar.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: NavBar(
        title: 'Boton',
        cosa: Scaffold(
          backgroundColor: Colors.cyanAccent,
          body: BotonLol(),
        ),
      ),
    );
  }
}

class BotonLol extends StatelessWidget {
  const BotonLol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

//NO SE COMO PONERLO EN EL SCAFFOLD
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


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Forma(),
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