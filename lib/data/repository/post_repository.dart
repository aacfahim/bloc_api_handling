import 'dart:convert';

import 'package:api_handling_bloc/data/model/post_model.dart';
import 'package:api_handling_bloc/data/repository/api.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final List<PostModel> posts = [];

  Future<List<PostModel>> getPost() async {
    final response = await http.get(Uri.parse(API().POSTS_BASE_URL));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var i in data) {
        posts.add(PostModel.fromJson(i));
      }
      return posts;
    } else {
      return posts;
    }
  }
}
