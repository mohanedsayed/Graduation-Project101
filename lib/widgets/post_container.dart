import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/post_icon.dart';
import 'package:graduation_project101/widgets/post_interaction.dart';
import 'package:graduation_project101/widgets/veritical_divider.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey[300], blurRadius: 25),
            ],
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(14),
        // decoration: BoxDecoration(borderRadius:),
        width: 40,
        height: MediaQuery.of(context).size.height * 0.2,

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
                PostIcon(icon: Icons.thumb_up_alt_outlined),
                PostInteraction(
                  text: 'Agree',
                ),
                PostIcon(
                  icon: Icons.repeat_rounded,
                ),
                PostInteraction(
                  text: 'Share',
                ),
                PostIcon(
                  icon: Icons.comment_rounded,
                ),
                PostInteraction(
                  text: 'Comment',
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
}
