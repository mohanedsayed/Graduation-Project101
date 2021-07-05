import 'package:flutter/material.dart';
import 'package:graduation_project101/widgets/navigation_drawer.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: DrawerContainer(),
        ),
      ),
    );
  }
}
