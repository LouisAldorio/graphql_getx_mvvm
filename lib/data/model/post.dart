import 'package:graphql_getx_mvvm/data/model/author.dart';
import 'package:graphql_getx_mvvm/data/model/comment.dart';

class Post {
  String id;
  String title;
  String body;

  Author author;
  List<Comment>? comments;

  Post(
      {required this.id,
      required this.title,
      required this.body,
      required this.author,
      this.comments});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      author: Author.fromJson(json["author"]),
      comments: json["comments"]?.map<Comment>((e) => Comment.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
