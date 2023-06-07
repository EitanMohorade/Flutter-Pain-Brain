import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Baserow extends StatefulWidget {
  const Baserow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BaserowState createState() => _BaserowState();
}

class _BaserowState extends State<Baserow> {
  late Future<Ejemplo> futurDataFromBaserow;

  @override
  void initState() {
    super.initState();
    futurDataFromBaserow = fetchDataFromBaserow();
  }

  Future<Ejemplo> fetchDataFromBaserow() async {
    final url = Uri.parse(
        'http://localhost/api/database/rows/table/1239/3/?user_field_names=true');
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
      throw Exception('Error al obtener datos de Baserow');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Aplicación'),
      ),
      body: Center(
        child: FutureBuilder<Ejemplo>(
          future: futurDataFromBaserow,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Ejemplo {
  final String name;

  Ejemplo({required this.name});

  factory Ejemplo.fromJson(Map<String, dynamic> json) {
    return Ejemplo(
      name: json['Name'] as String,
    );
  }
}
