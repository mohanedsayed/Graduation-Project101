import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/post_icon.dart';
import 'package:graduation_project101/widgets/post_interaction.dart';

class QuestionPostContainer extends StatelessWidget {
  const QuestionPostContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey[400], blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(14),
        // decoration: BoxDecoration(borderRadius:),
        width: 40,
        height: MediaQuery.of(context).size.height * 0.3,

        child: Column(
          children: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          // height: size.height * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Color(0xFF5224E3), fontSize: 18),
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Answer',
                                    style: TextStyle(
                                        color: Color(0xFF888888), fontSize: 18),
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                        color: Color(0xFF5224E3), fontSize: 18),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Why did Thanos lost battle in Avengers: Endgame?',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration.collapsed(
                                hintText: 'Write your answer'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              child: Text(
                'Why did Thanos lost battle in Avengers: Endgame?',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.grey[600],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Frequent Answer',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                IconButton(
                  iconSize: 20,
                  color: Colors.grey[400],
                  icon: Icon(
                    Icons.cancel,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
