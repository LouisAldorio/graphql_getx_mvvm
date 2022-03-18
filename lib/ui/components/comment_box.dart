import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  final Widget? image;
  final TextEditingController controller;
  final BorderRadius? inputRadius;
  final Function onSend;

  const CommentBox(
      {Key? key,
      this.image,
      required this.controller,
      this.inputRadius,
      required this.onSend})
      : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  Widget? image;

  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 1,
          color: Colors.grey[300],
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: "Add New Comment",
              suffixIcon: IconButton(
                icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                onPressed: () {
                  widget.onSend();
                },
              ),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: widget.inputRadius ?? BorderRadius.circular(32),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
