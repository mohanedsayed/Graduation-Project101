import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/post_icon.dart';
import 'package:graduation_project101/widgets/post_interaction.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({
    Key key,
    @required this.onAgreePressed,
  }) : super(key: key);

  final Function onAgreePressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        // height: size.height * 0.9,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              // height: size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style:
                            TextStyle(color: Color(0xFF5224E3), fontSize: 18),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Comments',
                        style:
                            TextStyle(color: Color(0xFF888888), fontSize: 18),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Post',
                        style:
                            TextStyle(color: Color(0xFF5224E3), fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'James jones',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Today 4:20',
                                    style: TextStyle(color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(color: Colors.grey[100]),
                            ], borderRadius: BorderRadius.circular(16)),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolor.'),
                          ),
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () => onAgreePressed,
                                child: Row(
                                  children: [
                                    PostIcon(icon: Icons.thumb_up_alt_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    PostInteraction(
                                      text: 'Agree',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    PostIcon(icon: Icons.reply),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    PostInteraction(
                                      text: 'Reply',
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              PostIcon(
                                icon: Icons.redo_sharp,
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadiusDirectional.horizontal(
                          start: Radius.circular(18),
                          end: Radius.circular(18))),
                  height: size.height * 0.05,
                  width: size.width * 0.8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration.collapsed(
                            hintText: ' Add Caption here'),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
