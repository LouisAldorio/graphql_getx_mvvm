import 'package:flutter/material.dart';

class Authors extends StatelessWidget {
  Authors({ Key? key }) : super(key: key);

  int counter = 0;


  @override
  Widget build(BuildContext context) {
    print("BUILD AUTHORRR ");
    counter++;
    return Container(
      child: Text('Authors $counter'),
    );
  }
}