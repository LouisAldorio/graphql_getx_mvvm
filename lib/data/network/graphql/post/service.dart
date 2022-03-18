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
      print(result.exception?.graphqlErrors[0].message);
      return Resource(
        data: posts,
        isLoading: false,
        error: Error(
          message: result.exception?.graphqlErrors[0].message,
          data: posts,
        ),
      );
    } else if (result.data != null) {
      posts = result.data!["posts"]["data"]
          .map<Post>((dynamic item) => Post.fromJson(item))
          .toList();

      return Resource(data: posts, isLoading: false, error: null);
    } else if(result.isLoading) {
      return Resource(data: posts, isLoading: result.isLoading, error: null); 
    }

    return Resource(data: posts, isLoading: result.isLoading, error: null); 
  }
}
