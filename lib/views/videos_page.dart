import 'package:flutter/material.dart';
import 'package:graduation_project101/views/videos/video_player.dart';

class VideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: Drawer(
      //   child: Icon(Icons.add_to_home_screen_outlined),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Videos',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return VideoContainer(
                  height1: 10,
                  width1: 200,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayer(),
                    ),
                  ),
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return Center(
                  child: VideoThumbnail(
                    height1: 200,
                    width1: MediaQuery.of(context).size.width * 0.85,
                  ),
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
  final Function onPressed;
  const VideoContainer({
    Key key,
    this.onPressed,
    this.height1,
    this.width1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayer(),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(spreadRadius: 0.5, blurRadius: .5, color: Colors.grey),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: height1,
          width: width1,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: width1,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      elevation: 4,
                      margin: EdgeInsets.all(6),
                      color: Colors.grey[700],
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          '20:30',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Iron Man Suit up scene',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'John Jackson - Today, 04:30',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      //  Row(
      //   children: [
      //     Stack(
      //       children: [
      //         Container(
      //           height: height1,
      //           width: width1,
      //           decoration: BoxDecoration(
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey,
      //                 blurRadius: 2,
      //               ),
      //             ],
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(18),
      //           ),
      //         ),
      //         Container(
      //           height: 0.5 * height1,
      //           width: width1,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(18),
      //                   topRight: Radius.circular(18)),
      //               color: Colors.red),
      //         ),
      //         Positioned(
      //           top: 45,
      //           right: 3,
      //           child: Card(
      //             // borderOnForeground: false,
      //             // elevation: 2,
      //             margin: EdgeInsets.all(5),
      //             color: Colors.grey[700],
      //             child: Text(
      //               '20:30',
      //               style: TextStyle(color: Colors.white, fontSize: 12),
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           bottom: 40,
      //           left: 8,
      //           child:
      // Text(
      //             'Iron Man Suit up scene',
      //             style: TextStyle(fontSize: 16),
      //           ),
      //         ),
      //         Positioned(
      //           bottom: 20,
      //           left: 8,
      //           child:
      // Text(
      //             'John Jackson - Today, 04:30',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(fontSize: 12),
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  final double height1;

  final double width1;
  const VideoThumbnail({
    Key key,
    this.height1,
    this.width1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                      blurRadius: 3,
                      spreadRadius: .5,
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
                top: 65,
                right: 10,
                child: Card(
                  // borderOnForeground: false,
                  // elevation: 2,
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[700],
                  child: Text(
                    '20:30',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 8,
                child: Text(
                  'Iron Man Suit up scene',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Positioned(
                bottom: 25,
                left: 8,
                child: Text(
                  'John Jackson - Today, 04:30',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
