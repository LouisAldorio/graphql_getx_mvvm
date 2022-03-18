import "package:graphql_flutter/graphql_flutter.dart";
import "package:graphql_getx_mvvm/data/network/graphql/client.dart";
import 'package:graphql_getx_mvvm/data/model/post.dart';
import 'package:graphql_getx_mvvm/data/model/resource.dart';
import 'package:graphql_getx_mvvm/data/network/graphql/post/schema.dart';

class PostServices {
  Future<Resource<List<Post>>> getPosts(int page, int limit) async {
    List<Post> posts = [];

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(getPostsQuery),
        variables: {
          "page": page,
          "limit": limit,
        },
      ),
    );

    if (result.hasException) {
      return Resource(
        data: posts,
        metadata: null,
        error: Error(
          message: result.exception?.graphqlErrors[0].message,
          extensions: result.exception?.graphqlErrors[0].extensions
        ),
      );
    } else if (result.data != null && !result.isLoading) {
      posts = result.data!["posts"]["data"]
          .map<Post>((dynamic item) => Post.fromJson(item))
          .toList();

      return Resource(data: posts, error: null, metadata: Metadata(
        currentPage: result.data!["posts"]["currentPage"],
        total: result.data!["posts"]["count"],
        totalPages: result.data!["posts"]["totalPages"]
      ));
    }
    return Resource(data: posts, error: null, metadata: null);
  }
}
