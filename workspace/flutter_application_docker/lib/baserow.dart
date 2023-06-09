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
              return Text(snapshot.data!.address);
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
  int id;
  String order;
  String name;
  String notes;
  String address;
  String walkability;
  String transit;
  String built;

  Ejemplo({
    required this.id,
    required this.order,
    required this.name,
    required this.notes,
    required this.address,
    required this.walkability,
    required this.transit,
    required this.built,
  });

  factory Ejemplo.fromJson(Map<String, dynamic> json) => Ejemplo(
        id: json["id"],
        order: json["order"],
        name: json["Name"],
        notes: json["Notes"],
        address: json["Address"],
        walkability: json["Walkability"],
        transit: json["Transit"],
        built: json["Built"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "Name": name,
        "Notes": notes,
        "Address": address,
        "Walkability": walkability,
        "Transit": transit,
        "Built": built,
      };
}
