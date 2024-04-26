import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_blo/Models/post_model.dart';
import 'package:http/http.dart' as http;

class PostApiRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((json) {
          return PostModel(
              postId: json['postId'] as int,
              id: json['id'] as int,
              name: json['name'] as String,
              body: json['body'] as String);
        }).toList();
      } else {
        return [];
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Time OUt');
    }
  }
}
