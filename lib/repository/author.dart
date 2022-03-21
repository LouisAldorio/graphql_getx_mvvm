import 'package:graphql_getx_mvvm/data/model/author.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/author/service.dart';

class AuthorsRepository {

  Future<Resource<List<Author>>> getAuthors(int? page, int? limit) async {
    return AuthorServices().getAuthors(page, limit);
  }
}