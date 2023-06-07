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
    Uri.parse('wss://api.baserow.io/ws/core/?jwt_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2MTU5NzQ0LCJpYXQiOjE2ODYxNTkxNDQsImp0aSI6ImY1YzM5NjBhMzk5ZTQxNjg5OTM1Y2EzMjU3ZWMwODgxIiwidXNlcl9pZCI6MzQ5NzZ9.bK6o-jpnpouBcdQU1t_mlkViemzq-AfwywMdjVbANMw'),
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
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              print('Received: ${snapshot.data}');
              // Imprimir el token JWT
              return Container();
            }

            return const Text('Connection established.');
          },
        ),
      ),
    );
  }
}
