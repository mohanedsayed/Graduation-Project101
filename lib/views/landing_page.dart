import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/post_container.dart';
import 'package:graduation_project101/widgets/question_post_container.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.deepPurple[50],
            radius: 15,
            child: Icon(
              Icons.search,
              size: 20,
              color: Colors.purple[900],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            backgroundColor: Colors.deepPurple[50],
            radius: 15,
            child: Icon(
              Icons.messenger_outline_rounded,
              size: 15,
              color: Colors.purple[900],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            PostContainer(),
            QuestionPostContainer(),
            PostContainer(),
            PostContainer(),
          ],
          padding: EdgeInsets.only(top: 20, left: 16, right: 16),
        ),
      ),
    );
  }
}
