import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  splashRadius: 1,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            ),
            Container(
              height: size.height * 0.3,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Black Widow is huge thot'),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text('3.8M views  -  '),
                              Text('Today, 03:54 PM')
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          Text('3.5M Like')
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Icon(Icons.thumb_down_outlined),
                          Text('1.5k Dislike')
                        ],
                      ),
                      SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      endIndent: 20,
                      thickness: 1,
                      indent: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Uploaded by:',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amberAccent,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Jackson'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Entairtainment & Movies'),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF1E57F3)),
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            'Follow',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1E57F3)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: .5,
                    color: Colors.grey,
                  ),
                  Text('Comments'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
