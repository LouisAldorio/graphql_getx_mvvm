import "package:graphql_flutter/graphql_flutter.dart";
import "package:graphql_getx_mvvm/data/network/graphql/client.dart";
import 'package:graphql_getx_mvvm/data/model/comment.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/comment/schema.dart';

class CommentServices {

  // create new comment
  Future<Resource<List<Comment>>> getComments(int page, int limit) async {
    List<Comment> comments = [];


    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.getClient();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(getCommentsQuery),
        variables: {
          "page": page,
          "limit": limit,
        },
      ),
    );

    if (result.hasException) {
      return Resource(
        data: comments,
        metadata: null,
        error: Error(
            message: result.exception?.graphqlErrors[0].message,
            extensions: result.exception?.graphqlErrors[0].extensions
        ),
      );
    } else if (result.data != null && !result.isLoading) {
      comments = result.data!["comments"]["data"]
          .map<Comment>((dynamic item) => Comment.fromJson(item))
          .toList();

      return Resource(data: comments, error: null, metadata: Metadata(
          currentPage: result.data!["comments"]["currentPage"],
          total: result.data!["comments"]["count"],
          totalPages: result.data!["comments"]["totalPages"]
      ));
    }
    return Resource(data: comments, error: null, metadata: null);
  }
}
