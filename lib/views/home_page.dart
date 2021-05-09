import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation_project101/views/Chat.dart';
import 'package:graduation_project101/views/Notifications.dart';
import 'package:graduation_project101/views/landing_page.dart';
import 'package:graduation_project101/views/videos_page.dart';
import 'package:graduation_project101/widgets/post_container.dart';
import 'package:graduation_project101/widgets/question_post_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tabController;
  int currentIndex;
  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

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
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        child: TabBar(
          labelColor: Colors.deepPurple[700],
          unselectedLabelColor: Colors.grey[400],
          onTap: (value) {
            currentIndex = value;
          },
          indicatorColor: Colors.transparent,
          controller: tabController,
          tabs: [
            Icon(
              Icons.home,
              size: 33,
            ),
            Icon(
              Icons.mic_none,
              size: 33,
            ),
            Icon(
              Icons.videocam_outlined,
              size: 33,
            ),
            Icon(
              Icons.notifications_active_outlined,
              size: 33,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          LandingPage(),
          ChatHome(),
          VideosPage(),
          Notifications(),
        ],
      ),
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
