import 'dart:convert';

import 'package:http/http.dart' as http;

class JokeRemoteDataSource {
  final http.Client client;

  JokeRemoteDataSource(this.client);

  Future<String> fetchJoke() async {
    final response = await client.get(Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['joke'];
    } else {
      throw Exception('Failed to fetch joke');
    }
  }
}