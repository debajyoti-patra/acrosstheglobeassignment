import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppServices {
  static Future<List<dynamic>> getData(String url, BuildContext context) async {
    try {
      var response = await http.get(Uri.parse(url));
      var result = jsonDecode(response.body);
      List data = result['items'] as List<dynamic>;
      return data;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Some error occoured'),
        ),
      );
      return [];
    }
  }
}
