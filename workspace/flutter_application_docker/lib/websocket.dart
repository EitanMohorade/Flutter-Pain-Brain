import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  const WebSocket({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<WebSocket> createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocket> {
  final _channel = WebSocketChannel.connect(
    Uri.parse(
        'wss://api.baserow.io/ws/coret_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2MTYzMTEwLCJpYXQiOjE2ODYxNjI1MTAsImp0aSI6IjA2ODI0ZmY1MWRmMDQ3OTg5ZWI4MGFmMTNiYjU1YmE5IiwidXNlcl9pZCI6MzQ5NzZ9.4CAO4bBTnO_LSO1Fue7_sxPrX5oUSYRXIFawU1MVL-g'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebSocket Example'),
        ),
        body: StreamBuilder(
          stream: _channel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              print('Connection state: ${snapshot.connectionState}');
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              print('Received: ${snapshot.data}');
              return Container();
            }

            return const Text('Connection established.');
          },
        ),
      ),
    );
  }
}
