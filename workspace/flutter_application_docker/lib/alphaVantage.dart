import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlphaVantage extends StatefulWidget {
  const AlphaVantage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AlphaVantageState createState() => _AlphaVantageState();
}

class _AlphaVantageState extends State<AlphaVantage> {
  late Future<void> futurDataFromAlphaVantage;

  @override
  void initState() {
    super.initState();
    futurDataFromAlphaVantage = fetchDataFromAlphaVantage();
  }

  Future<void> fetchDataFromAlphaVantage() async {
    const token = 'GL6PWL42O1GZ5V3Q';
    final url = Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol=IBM&apikey=${token}');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return print('Response: ${response.body}');
    } else {
      throw Exception('Error al obtener datos de AlphaVantage');
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
