import "package:graphql_getx_mvvm/data/model/author.dart";

class Comment {
  String id;
  String body;

  Author author;

  Comment({required this.id, required this.body, required this.author});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      body: json['body'],
      author: Author.fromJson(json["author"]),
    );
  }
}
