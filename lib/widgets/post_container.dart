import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/post_icon.dart';
import 'package:graduation_project101/widgets/post_interaction.dart';
import 'package:graduation_project101/widgets/threeDots_container.dart';
import 'package:graduation_project101/widgets/veritical_divider.dart';

import 'comment_container.dart';

class PostContainer extends StatelessWidget {
  final Function onAgreePressed;
  final Function onSharePressed;
  final bool hidden = false;

  const PostContainer({
    Key key,
    this.onAgreePressed,
    this.onSharePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey[400], blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage('assets/users/person.jpg')),
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
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ),
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
              VerticalDivider1(),
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
              VerticalDivider1(),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return CommentContainer(onAgreePressed: onAgreePressed);
                    },
                  );
                },
                child: Row(
                  children: [
                    PostIcon(icon: Icons.mode_comment_outlined),
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
                onPressed: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => ThreeDots(),
                ),
                icon: Icons.more_horiz,
              ),
            ],
          ),
        ],
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 12.0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         // gradient: LinearGradient(colors: [Colors.black, Colors.white]),
    //         color: Colors.white,
    //         boxShadow: [
    //           BoxShadow(color: Colors.grey[400], blurRadius: 10),
    //         ],
    //         borderRadius: BorderRadius.circular(8)),
    //     padding: EdgeInsets.all(14),
    //     // decoration: BoxDecoration(borderRadius:),
    //     // width: 40,
    //     // height: MediaQuery.of(context).size.height * 0.25,

    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             CircleAvatar(
    //               backgroundImage: NetworkImage(
    //                   'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
    //             ),
    //             SizedBox(width: 10),
    //             Column(
    //               children: [
    //                 Text(
    //                   'James jones',
    //                   style: TextStyle(fontSize: 16),
    //                 ),
    //                 SizedBox(
    //                   height: 4,
    //                 ),
    //                 Text(
    //                   'Today,   03:30',
    //                   style:
    //                       TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Text(
    //             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolor.'),
    //         Spacer(),
    //         Divider(
    //           thickness: 1.5,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             GestureDetector(
    //               onTap: () => onAgreePressed,
    //               child: Row(
    //                 children: [
    //                   PostIcon(icon: Icons.thumb_up_alt_outlined),
    //                   SizedBox(
    //                     width: 5,
    //                   ),
    //                   PostInteraction(
    //                     text: 'Agree',
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             GestureDetector(
    //               onTap: () => onSharePressed,
    //               child: Row(
    //                 children: [
    //                   PostIcon(
    //                     icon: Icons.repeat_rounded,
    //                   ),
    //                   SizedBox(
    //                     width: 5,
    //                   ),
    //                   PostInteraction(
    //                     text: 'Share',
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             GestureDetector(
    //               onTap: () {
    //                 showModalBottomSheet(
    //                   backgroundColor: Colors.transparent,
    //                   context: context,
    //                   isScrollControlled: true,
    //                   builder: (context) {
    //                     return CommentContainer(onAgreePressed: onAgreePressed);
    //                   },
    //                 );
    //               },
    //               child: Row(
    //                 children: [
    //                   PostIcon(
    //                     icon: Icons.comment_rounded,
    //                   ),
    //                   SizedBox(
    //                     width: 5,
    //                   ),
    //                   PostInteraction(
    //                     text: 'Comment',
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               width: 40,
    //             ),
    //             PostIcon(
    //               icon: Icons.reply_rounded,
    //             ),
    //             PostIcon(
    //               onPressed: () => showModalBottomSheet(
    //                 backgroundColor: Colors.transparent,
    //                 context: context,
    //                 builder: (context) => ThreeDots(),
    //               ),
    //               icon: Icons.more_horiz,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
