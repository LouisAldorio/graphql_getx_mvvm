import 'package:graphql_getx_mvvm/data/model/author.dart';

class Post {
  String id;
  String title;
  String body;

  Author author;

  Post(
      {required this.id,
      required this.title,
      required this.body,
      required this.author});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        author: Author(id: json["id"], name: json["author"]["name"]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
