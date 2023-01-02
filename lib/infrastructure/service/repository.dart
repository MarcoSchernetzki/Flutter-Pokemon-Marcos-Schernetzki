import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokeapi/infrastructure/model/pokeapi.dart';

class Repository {
  getData() async {
    final client = http.Client();

    final uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = response.body;
      return pokeApiFromJson(json);
    }
  }

  getImageData(String url) async {
    final client = http.Client();

    final uri = Uri.parse(url);
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = response.body;
      return pokeImageFromJson(json);
    }
  }
}
