import 'package:flutter/material.dart';

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Icon(Icons.add_to_home_screen_outlined),
      ),
      appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.mail),
          //   onPressed: () => Scaffold.of(context).openDrawer(),
          // ),
          // title: Text('thus he said it shall be done '),
          ),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: TextButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            child: Text('click me'),
          ),
        ),
      ),
    );
  }
}
