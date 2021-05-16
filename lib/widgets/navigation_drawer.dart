import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit_rounded),
            )
          ],
        ),
      ),
    );
  }
}
