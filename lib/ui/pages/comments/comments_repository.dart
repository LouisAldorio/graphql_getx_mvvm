import 'package:graphql_getx_mvvm/data/model/comment.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/comment/service.dart';

class CommentsRepository {
  Future<Resource<List<Comment>>> getComments(int page, int limit) async {
    return CommentServices().getComments(page, limit);
  }
}