import 'package:flutter/material.dart';
import "package:graphql_getx_mvvm/data/model/comment.dart";

class CommentCard extends StatelessWidget {

  final Comment comment;

  const CommentCard({
    Key? key,
    required this.comment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(5),
        color: Theme.of(context).cardColor,
        elevation: 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: double.infinity,
          ),
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage("https://source.unsplash.com/random/300x300/?fruit"),
                            scale: 1.0,
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Text(
                      "${comment.author.name}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                comment.body,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).disabledColor
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
    );
  }
}
