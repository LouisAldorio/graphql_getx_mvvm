import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfig {
  static String token =
      "your can get it from a secured storage"; // shared preference
  static HttpLink httpLink = HttpLink(
    'https://api.graphqlplaceholder.com/',
  );

  GraphQLClient getClient() {
    AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link,
    );
  }
}
