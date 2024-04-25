import 'dart:convert';
import 'dart:io';

import 'package:flutter_blo/Models/post_model.dart';
import 'package:http/http.dart' as http;

class PostApiRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response == 200) {
        final body = json.decode(response.body) as List;
        return body.map((json) {
          return PostModel(
              postId: json['postId'] as int,
              it: json['it'] as int,
              name: json['name'] as String,
              email: json['email'] as String,
              body: json['body'] as String);
        }).toList();
      } else {
        return [];
      }
    } on SocketException {
      throw Exception('Check Your Internet Connection');
    }
  }
}
