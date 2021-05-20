import 'package:flutter/material.dart';
import 'package:graduation_project101/views/direct_contact/direct_contact1.dart';
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
    Size size = MediaQuery.of(context).size;
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
          GestureDetector(
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Container(
                height: size.height * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage('assets/users/direct_contact.png'),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Direct Contact',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Text(
                        'Our app can recognise the the audio it listens to and \nconverts it into text.',
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DirectContact(),
                        ),
                      ),
                      child: Container(
                        height: 50,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Color(0xFF5224E3),
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                          child: Text(
                            'Start Contacting',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple[50],
              radius: 20,
              child: Icon(
                Icons.mic,
                size: 28,
                color: Colors.purple[900],
              ),
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
