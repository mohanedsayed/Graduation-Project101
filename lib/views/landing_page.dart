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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[500],
        onPressed: () {
          modalBottomSheet(context, size);
        },
        child: Icon(
          Icons.add_circle,
          color: Colors.white,
          size: 38,
        ),
      ),
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
                    SizedBox(
                      height: 10,
                    ),
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
                        'Our app can recognise the the audio it listens to and converts it into text.',
                        style: TextStyle(),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DirectContact(),
                          ),
                        );

                        // Navigator.pop(context);
                      },
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
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
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

  Future modalBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
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
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style:
                              TextStyle(color: Color(0xFF5224E3), fontSize: 18),
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Add question',
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Add question here'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
