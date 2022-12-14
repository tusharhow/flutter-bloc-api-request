import 'package:bloc_api/src/model/post.dart';
import '../services/api_service.dart';


class PostRepository {
  final PostService _postService = PostService();
  
  Future<List<Post>> fetchPost() async {
    return await _postService.getPost();
  }
}
