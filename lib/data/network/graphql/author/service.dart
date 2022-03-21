import "package:graphql_flutter/graphql_flutter.dart";
import 'package:graphql_getx_mvvm/data/model/author.dart';
import "package:graphql_getx_mvvm/data/network/graphql/client.dart";
import 'package:graphql_getx_mvvm/data/model/comment.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/author/schema.dart';

class AuthorServices {
  // create new comment
  Future<Resource<List<Author>>> getAuthors(int? page, int? limit) async {
    List<Author> authors = [];

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.getClient();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(getAuthorsQuery),
        variables: {
          "page": page,
          "limit": limit,
        },
      ),
    );

    if (result.hasException) {
      return Resource(
        data: authors,
        metadata: null,
        error: Error(
          message: result.exception?.graphqlErrors[0].message,
          extensions: result.exception?.graphqlErrors[0].extensions,
        ),
      );
    } else if (result.data != null && !result.isLoading) {
      authors = result.data!["users"]["data"]
          .map<Author>((dynamic item) => Author.fromJson(item))
          .toList();

      return Resource(
        data: authors,
        error: null,
        metadata: Metadata(
          currentPage: result.data!["users"]["currentPage"],
          total: result.data!["users"]["count"],
          totalPages: result.data!["users"]["totalPages"],
        ),
      );
    }
    return Resource(data: authors, error: null, metadata: null);
  }
}
