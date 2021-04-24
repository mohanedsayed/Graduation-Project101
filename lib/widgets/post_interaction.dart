import 'package:flutter/material.dart';

class PostInteraction extends StatelessWidget {
  final String text;
  const PostInteraction({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
