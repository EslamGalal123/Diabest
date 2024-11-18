import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  final String _baseUrl = "https://graduation-project-sigma.vercel.app/";
  Future<Map<String, dynamic>> get(String url) async {
    var response = await http.get(Uri.parse(_baseUrl + url));
    var json = jsonDecode(response.body);
    return json;
  }

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> data,
      {String? token}) async {
    var headers = token == null
        ? {'Content-Type': 'application/json'}
        : {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          };

    var response = await http.post(
      Uri.parse(_baseUrl + url),
      body: json.encode(data),
      headers: headers,
    );
    var jsons = jsonDecode(response.body);
    return jsons;
  }

  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> data,
      {required String token}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.put(
      Uri.parse(_baseUrl + url),
      body: json.encode(data),
      headers: headers,
    );
    var jsons = jsonDecode(response.body);
    return jsons;
  }

  Future<Map<String, dynamic>> putfile(String url, Map<String, dynamic> data,
      {required String token}) async {
    var headers = {
      'Content-Type': "MediaType/('image', 'jpeg')",
      'Authorization': 'Bearer $token'
    };
    var response = await http.put(
      Uri.parse(_baseUrl + url),
      body: data,
      headers: headers,
    );
    var jsons = jsonDecode(response.body);
    return jsons;
  }
}
