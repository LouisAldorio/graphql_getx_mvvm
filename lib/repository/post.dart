import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/post/service.dart';

class PostRepository {
  Future<Resource<List<Post>>> getPosts(int? page, int? limit) async {
    return PostServices().getPosts(page, limit);
  }

  Future<Resource<Post>> getPost(String id) async {
    return PostServices().getPost(id);
  }

  Future<Resource<Post>> createPost(
    String title,
    String body,
    String userId,
  ) async {
    return PostServices().createPost(userId, title, body);
  }
}
