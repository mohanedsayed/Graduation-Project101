import 'package:flutter/material.dart';
import 'package:graduation_project101/constants/colors.dart';

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
    return Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/users/drawerBackground.png"),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      padding: EdgeInsets.only(bottom: 10, left: 15, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '@John_Doe',
                            style: TextStyle(color: fadedTextColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFF9F9F9),
                child: Column(
                  children: [
                    DrawerTile(
                      icon: Icons.person_outline,
                      text: 'Profile',
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    DrawerTile(
                      icon: Icons.help_outline,
                      text: 'Help Center',
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 25, right: 25, bottom: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.1,
                              spreadRadius: 0.2,
                              color: Colors.grey,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'About',
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    DrawerTile(
                      text: 'Settings',
                      icon: Icons.settings,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 25, right: 25, bottom: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.1,
                              spreadRadius: 0.2,
                              color: Colors.grey,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 80,
          left: 25,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/users/person.jpg'),
            ),
          ),
        ),
      ],
    );

    // return Container(
    //   color: Colors.white,
    //   child: Column(
    //     children: [
    //       Container(
    //         height: MediaQuery.of(context).size.height * 0.25,
    //         width: MediaQuery.of(context).size.width,
    //         color: Colors.purple[900],
    //         child: Stack(
    //           children: [
    //             Positioned(
    //               top: 10.0,
    //               left: 20.0,
    //               child: CircleAvatar(
    //                 backgroundImage: NetworkImage(
    //                     'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg'),
    //                 radius: 50,
    //               ),
    //             ),
    //             Positioned(
    //               child: Text(
    //                 'Bill Getes',
    //                 style: TextStyle(
    //                     fontSize: 20.0,
    //                     fontWeight: FontWeight.w400,
    //                     fontStyle: FontStyle.normal),
    //               ),
    //               top: 125,
    //               left: 28,
    //             ),
    //             Positioned(
    //               child: Text(
    //                 '@user123456',
    //                 style: TextStyle(
    //                     color: Colors.black87,
    //                     fontSize: 15.0,
    //                     fontWeight: FontWeight.w200,
    //                     fontStyle: FontStyle.normal),
    //               ),
    //               top: 145,
    //               left: 28,
    //             ),
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.person,
    //               color: Colors.black,
    //               size: 30,
    //             ),
    //             Text(
    //               ' Profile',
    //               style: TextStyle(color: Colors.black87),
    //             )
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.video_settings,
    //               color: Colors.black,
    //               size: 30,
    //             ),
    //             Text(
    //               ' Videos',
    //               style: TextStyle(color: Colors.black87),
    //             )
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.photo_album,
    //               color: Colors.black,
    //               size: 30,
    //             ),
    //             Text(
    //               ' photos',
    //               style: TextStyle(color: Colors.black87),
    //             )
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.settings_applications,
    //               color: Colors.black,
    //               size: 30,
    //             ),
    //             Text(
    //               ' Settings',
    //               style: TextStyle(color: Colors.black87),
    //             )
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.help,
    //               color: Colors.black,
    //               size: 30,
    //             ),
    //             Text(
    //               ' Help',
    //               style: TextStyle(color: Colors.black87),
    //             )
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.info,
    //               color: Colors.black,
    //               size: 30,
    //             ),
    //             Text(
    //               ' About',
    //               style: TextStyle(color: Colors.black87),
    //             )
    //           ],
    //         ),
    //       ),
    //       Divider(
    //         color: Colors.black26,
    //       ),
    //       Spacer(),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.logout,
    //               color: Colors.black,
    //               size: 30,
    //             ),
    //             Text(
    //               ' Signout',
    //               style: TextStyle(color: Colors.black87),
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class DrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  const DrawerTile({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 0.1,
          spreadRadius: 0.2,
          color: Colors.grey,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
          )
        ],
      ),
    );
  }
}
