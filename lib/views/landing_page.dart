import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/navigation_drawer.dart';
import 'package:graduation_project101/widgets/post_container.dart';
import 'package:graduation_project101/widgets/question_post_container.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        leading: GestureDetector(
          onTap: () => _scaffoldKey.currentState.openDrawer(),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.deepPurple[50],
            radius: 20,
            child: Icon(
              Icons.search,
              size: 28,
              color: Colors.purple[900],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.deepPurple[50],
            radius: 20,
            child: Icon(
              Icons.mic,
              size: 28,
              color: Colors.purple[900],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Builder(builder: (context) {
        return Container(
          color: Colors.white,
          child: ListView(
            children: [
              PostContainer(
                onAgreePressed: () {},
                onSharePressed: () {},
              ),
              QuestionPostContainer(),
              PostContainer(),
              PostContainer(),
            ],
            padding: EdgeInsets.only(top: 20, left: 16, right: 16),
          ),
        );
      }),
    );
  }
}
