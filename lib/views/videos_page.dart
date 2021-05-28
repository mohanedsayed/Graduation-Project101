import 'package:flutter/material.dart';

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: Drawer(
        child: Icon(Icons.add_to_home_screen_outlined),
      ),
      appBar: AppBar(
        title: Text('Videos'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Text('Uploaded'),
              ),
            ],
          ),
          Container(child: VideoContainer()),
        ],
      ),
    );
  }
}

class VideoContainer extends StatelessWidget {
  final double height1;
  final double width1;
  const VideoContainer({
    Key key,
    this.height1,
    this.width1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                    color: Colors.red),
              ),
              Positioned(
                top: 45,
                right: 3,
                child: Card(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[700],
                  child: Text(
                    '20:30',
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 8,
                child: Text(
                  'Iron Man Suit up scene',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 8,
                child: Text(
                  'John Jackson - Today, 04:30',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
