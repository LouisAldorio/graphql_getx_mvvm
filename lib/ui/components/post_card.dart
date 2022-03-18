import "package:flutter/material.dart";
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final String author;
  final String id;

  const PostCard(
      {Key? key,
      required this.title,
      required this.body,
      required this.author,
      required this.id})
      : super(key: key);

  Future<void> share() async {
    await FlutterShare.share(
        title: title,
        text: body,
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Share Posts');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: Colors.green.withAlpha(30),
          onTap: () {
            // Navigator.pushNamed(context,"/post-detail", arguments: PostArgument(id: id));
            Get.toNamed("/post-detail", arguments: 'Get is the best');
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Hero(
                  tag: "card_thumbnail$id",
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://source.unsplash.com/random/300x300/?girl"),
                  ),
                ),
                title: Text("$id $title"),
                subtitle: Text("Posted by $author"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  body,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Share'),
                    onPressed: share,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ));
  }
}
