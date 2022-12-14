import 'package:bloc_api/src/constants/api_constants.dart';
import 'package:bloc_api/src/model/post.dart';
import 'package:dio/dio.dart';

class PostService {
  Future<List<Post>> getPost() async {
    final Dio dio = Dio();

    final response = await dio.get(ApiConstants.BASE_URL + ApiConstants.POSTS);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((dynamic json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
