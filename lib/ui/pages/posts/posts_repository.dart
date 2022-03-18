import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/post/service.dart';

class PostsRepository {
  Future<Resource<List<Post>>> getPosts(int page, int limit) async {
    return PostServices().getPosts(page, limit);
  }
}
