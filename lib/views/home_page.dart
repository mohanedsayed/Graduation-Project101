import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation_project101/views/Chat.dart';
import 'package:graduation_project101/views/Notifications.dart';
import 'package:graduation_project101/views/landing_page.dart';
import 'package:graduation_project101/views/videos_page.dart';
import 'package:graduation_project101/widgets/navigation_drawer.dart';
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
    return Scaffold(
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
              Icons.textsms_rounded,
              size: 33,
            ),
            Icon(
              Icons.videocam_sharp,
              size: 33,
            ),
            Icon(
              Icons.notifications,
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
}
