import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/post_icon.dart';
import 'package:graduation_project101/widgets/post_interaction.dart';
import 'package:graduation_project101/widgets/veritical_divider.dart';

class PostContainer extends StatelessWidget {
  final Function onAgreePressed;
  final Function onSharePressed;

  const PostContainer({
    Key key,
    this.onAgreePressed,
    this.onSharePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [Colors.black, Colors.white]),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey[400], blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(14),
        // decoration: BoxDecoration(borderRadius:),
        width: 40,
        height: MediaQuery.of(context).size.height * 0.25,

        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      'James jones',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Today,   03:30',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolor.'),
            Spacer(),
            Divider(
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                GestureDetector(
                  onTap: () => onSharePressed,
                  child: Row(
                    children: [
                      PostIcon(
                        icon: Icons.repeat_rounded,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      PostInteraction(
                        text: 'Share',
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    comments(context, size);
                  },
                  child: Row(
                    children: [
                      PostIcon(
                        icon: Icons.comment_rounded,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      PostInteraction(
                        text: 'Comment',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                PostIcon(
                  icon: Icons.reply_rounded,
                ),
                PostIcon(
                  icon: Icons.more_horiz,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future comments(BuildContext context, Size size) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: size.height * 0.9,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
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
                                      PostIcon(
                                          icon: Icons.thumb_up_alt_outlined),
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
            ],
          ),
        );
      },
    );
  }
}
