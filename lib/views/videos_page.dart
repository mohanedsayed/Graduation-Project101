import 'package:flutter/material.dart';

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return VideoContainer(
                  height1: 140,
                  width1: 200,
                );
              },
            ),
          ),
          Divider(
            height: 3,
            thickness: 1,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Text('Videos'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 5),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return VideoContainer(
                  height1: 200,
                  width1: MediaQuery.of(context).size.width * 0.85,
                );
              },
            ),
          ),
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
                height: height1,
                width: width1,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              Container(
                height: 0.5 * height1,
                width: width1,
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
                  // borderOnForeground: false,
                  // elevation: 2,
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
