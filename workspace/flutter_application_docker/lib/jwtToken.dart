import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'baserow.dart';

class JwtToken extends StatefulWidget {
  const JwtToken({Key? key}) : super(key: key);

  @override
  _JwtTokenState createState() => _JwtTokenState();
}

class _JwtTokenState extends State<JwtToken> {
  late Future<Ejemplo> futureDataFromJwtToken;

  @override
  void initState() {
    super.initState();
    futureDataFromJwtToken = fetchDataFromJwtToken();
  }

  Future<Ejemplo> fetchDataFromJwtToken() async {
    final url = Uri.parse('https://api.baserow.io/api/database/tokens/1239/');
    const token = 'yDEJilCb8ziXGQ6mqLNYdnvcEaHWi1UX';

    final response = await http.get(
      url,
      headers: {'Authorization': 'Token $token'},
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      print('Response: ${response.body}');
      return Ejemplo.fromJson(jsonBody);
    } else {
      throw Exception('Error al obtener datos de jwtToken');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Aplicación'),
      ),
    );
  }
}
