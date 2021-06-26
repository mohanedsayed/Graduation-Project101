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
        body: SingleChildScrollView(
          child: Column(
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
                padding: const EdgeInsets.only(right: 16, left: 16.0),
                child: Column(
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
                        Text(
                          'Uploaded by:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
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
                    Text(
                      'Comments',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Add a comment')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),

                    Container(
                      height: size.height,
                      width: size.width,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (ctx, index) =>
                              VideoComment(userName: "userName")),
                    )
                    // Expanded(
                    //     child: ListView.builder(
                    //         itemBuilder: (context, index) =>
                    //             VideoComment(userName: "userName")))

                    // Container(
                    //   height: 400,
                    //   child: ListView.builder(
                    //     itemCount: 5,
                    //     itemBuilder: (context, index) => VideoComment(
                    //       userName: 'Jack Henderson',
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoComment extends StatelessWidget {
  final String userName;
  const VideoComment({
    Key key,
    @required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            Text(userName),
          ],
        ),
        Card(
          elevation: 2,
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nost'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20.0),
          child: GestureDetector(
            child: Row(
              children: [
                Text('36  Replies'),
                Icon(Icons.reply),
              ],
            ),
          ),
        )
      ],
    );
  }
}
