import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
/*
Launching lib/main.dart on sdk gphone x86 64 in debug mode...
main.dart:1
✓  Built build/app/outputs/flutter-apk/app-debug.apk.
cmd: Can't find service: activity
Error: ADB exited with exit code 1
Performing Streamed Install

adb: failed to install /home/eitan/Desktop/my_app/build/app/outputs/flutter-apk/app-debug.apk: cmd: Can't find service: package
Error launching application on sdk gphone x86 64.
Exited
*/
