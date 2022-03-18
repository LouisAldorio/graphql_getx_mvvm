import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/post/service.dart';

class PostRepository {
  Future<Resource<Post>> getPost(String id) async {
    return PostServices().getPost(id);
  }
}