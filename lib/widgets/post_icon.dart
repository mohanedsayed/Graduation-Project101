import 'package:flutter/material.dart';

class PostIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const PostIcon({
    Key key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        color: Colors.grey,
        size: 21,
      ),
    );
  }
}
