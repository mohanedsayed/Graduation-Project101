import 'package:flutter/material.dart';

class VerticalDivider1 extends StatelessWidget {
  const VerticalDivider1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 1,
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
