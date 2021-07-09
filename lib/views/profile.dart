import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:graduation_project101/constants/colors.dart';
import 'package:graduation_project101/widgets/post_container.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

String userName = 'John Doe';
String email = '@John_Doe120';
bool male = true;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          child: ListView(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage("assets/users/drawerBackground.png"),
                    ),
                  ),
                  Positioned(
                    top: 145,
                    left: 30,
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
                  Positioned(
                    top: 20,
                    left: 25,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            color: Color(
                              0xFF292826,
                            ).withOpacity(0.5),
                          ),
                        ]),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 40),
                child: Row(
                  children: [
                    Text(
                      userName,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                      child: Center(
                        child: Text(
                          '-',
                          style: TextStyle(color: fadedTextColor),
                        ),
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(color: fadedTextColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FeatherIcons.mail,
                          color: iconColor,
                        ),
                        SizedBox(width: 5),
                        Text('John.doe@gmail.com',
                            style: TextStyle(color: fadedTextColor2)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range_outlined, color: iconColor),
                        Text(
                          'Jan 07, 1997',
                          style: TextStyle(color: fadedTextColor2),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          male == true ? Icons.male : Icons.female,
                          color: iconColor,
                          size: 20,
                        ),
                        Text(
                          male == true ? 'Male' : 'Female',
                          style: TextStyle(color: fadedTextColor2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 16),
                child: Row(
                  children: [
                    SocialButton(
                      onPressed: () {},
                      margin: EdgeInsets.only(
                        left: 25,
                      ),
                      text: 'Friends',
                      icon: Icons.person_outline,
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                      containerColor: Colors.white,
                    ),
                    SocialButton(
                      iconColor: Color(0xFFFFFFFFF0),
                      margin: EdgeInsets.only(left: 20),
                      text: 'Message',
                      icon: FeatherIcons.messageCircle,
                      containerColor: primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
                child: Text(
                  'Recent Posts',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              PostContainer(),
              PostContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final Color containerColor;
  final Color iconColor;
  final String text;
  final IconData icon;
  final EdgeInsetsGeometry padding;
  final Function onPressed;
  final EdgeInsetsGeometry margin;
  const SocialButton({
    Key key,
    this.containerColor,
    this.text,
    this.icon,
    this.padding,
    this.margin,
    this.iconColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            // boxShadow: [
            // BoxShadow(
            //   blurRadius: 0.1,
            //   spreadRadius: 0.2,
            //   color: Colors.grey,
            // ),
            // ]
            color: containerColor,
            borderRadius: BorderRadius.circular(12)),
        padding: padding,
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(color: iconColor),
            )
          ],
        ),
      ),
    );
  }
}
