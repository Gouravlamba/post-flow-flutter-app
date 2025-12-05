import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/error/app_exceptions.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<dynamic>> getPosts() async {
    final uri = Uri.parse('$baseUrl/posts');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw NetworkException('Failed to fetch posts');
    }
  }

  Future<Map<String, dynamic>> getPostDetail(int postId) async {
    final uri = Uri.parse('$baseUrl/posts/$postId');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw NetworkException('Failed to fetch post detail');
    }
  }
}
