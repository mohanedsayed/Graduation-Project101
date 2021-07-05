import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: DrawerContainer());
  }
}

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple[900],
            child: Stack(
              children: [
                Positioned(
                  top: 10.0,
                  left: 20.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
                    radius: 50,
                  ),
                ),
                Positioned(
                  child: Text(
                    'Bill Getes',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal),
                  ),
                  top: 125,
                  left: 28,
                ),
                Positioned(
                  child: Text(
                    '@user123456',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.normal),
                  ),
                  top: 145,
                  left: 28,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  ' Profile',
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.video_settings,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  ' Videos',
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.photo_album,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  ' photos',
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings_applications,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  ' Settings',
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.help,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  ' Help',
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  ' About',
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black26,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  ' Signout',
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
