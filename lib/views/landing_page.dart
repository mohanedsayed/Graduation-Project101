import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:graduation_project101/constants/colors.dart';
import 'package:graduation_project101/views/direct_contact/speech_to_text.dart';
import 'package:graduation_project101/views/direct_contact/text_to_speech.dart';
import 'package:graduation_project101/widgets/comment_container.dart';
import 'package:graduation_project101/widgets/createPost.dart';
import 'package:graduation_project101/widgets/navigation_drawer.dart';
import 'package:graduation_project101/widgets/post_container.dart';
import 'package:graduation_project101/widgets/post_icon.dart';
import 'package:graduation_project101/widgets/post_interaction.dart';
import 'package:graduation_project101/widgets/question_post_container.dart';
import 'package:graduation_project101/widgets/threeDots_container.dart';
import 'package:image_picker/image_picker.dart';

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
      floatingActionButton:
          // FloatingActionButton.extended(

          //   label: Text('sss'),
          //   isExtended: true,
          //   backgroundColor: Colors.deepPurple[500],
          //   onPressed: () {
          //     modalBottomSheet(context, size);
          //   },
          //   // child: Icon(
          //   //   Icons.add_circle,
          //   //   color: Colors.white,
          //   //   size: 38,
          //   // ),
          // )
          SpeedDial(
        // both default to 16
        // childMarginTop: 18,
        marginEnd: 18,
        marginBottom: 20,
        // animatedIcon: AnimatedIcons.menu_close,
        // animatedIconTheme: IconThemeData(size: 22.0),
        /// This is ignored if animatedIcon is non null
        icon: Icons.add,
        activeIcon: Icons.remove,
        iconTheme: IconThemeData(color: Colors.grey[50], size: 40),

        /// The label of the main button.
        // label: Text("Open Speed Dial"),
        /// The active label of the main button, Defaults to label if not specified.
        // activeLabel: Text("Close Speed Dial"),
        /// Transition Builder between label and activeLabel, defaults to FadeTransition.
        // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
        /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
        buttonSize: 56.0,
        visible: true,

        /// If true user is forced to close dial manually
        /// by tapping main button and overlay is not rendered.
        closeManually: false,

        /// If true overlay will render no matter what.
        renderOverlay: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Post Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        // orientation: SpeedDialOrientation.Up,
        // childMarginBottom: 2,
        // childMarginTop: 2,
        children: [
          SpeedDialChild(
            child: Icon(Icons.post_add),
            backgroundColor: Colors.red,
            label: 'Post',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreatePost())),
            onLongPress: () => print('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: Icon(Icons.photo),
            backgroundColor: Colors.blue,
            label: 'Picture',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => modalBottomSheet(context, 'Image', true),
            onLongPress: () => print('SECOND CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: Icon(Icons.ondemand_video_outlined),
            backgroundColor: Colors.green,
            label: 'Video',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => modalBottomSheet(context, 'Video', true),
            onLongPress: () => print('THIRD CHILD LONG PRESS'),
          ),
        ],
      ),
      key: _scaffoldKey,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
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
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => TTSpeech())),
            child: CircleAvatar(
              backgroundColor: iconBackgroundColor,
              radius: 20,
              child: Icon(
                Icons.text_fields,
                size: 28,
                color: primaryColor,
              ),
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
                            builder: (context) => SpeechToText(),
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
              backgroundColor: iconBackgroundColor,
              radius: 20,
              child: Icon(Icons.mic, size: 28, color: primaryColor),
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

  Future modalBottomSheet(BuildContext context, String postType, bool video) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ModalBottomSheet(
          postType: postType,
          video: video,
        );
      },
    );
  }
}

class ModalBottomSheet extends StatefulWidget {
  final String postType;
  final bool video;

  const ModalBottomSheet({Key key, this.postType, this.video})
      : super(key: key);

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

bool pathChosen = false;

var imagePath = '';
void getImage(ImageSource imageSource) async {
  final pickedFile = await ImagePicker().getImage(source: imageSource);
  if (pickedFile != null) {
    imagePath = pickedFile.path;
    pathChosen = true;
  } else {
    print('no image chosen or taken');
  }
}

void getVideo(ImageSource imageSource) async {
  final pickedFile = await ImagePicker().getVideo(source: imageSource);
  if (pickedFile != null) {
    imagePath = pickedFile.path;
    pathChosen = true;
  } else {
    print('no video chosen or taken');
  }
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
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
                      style: TextStyle(color: Color(0xFF5224E3), fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      widget.postType,
                      style: TextStyle(color: Color(0xFF888888), fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Post',
                      style: TextStyle(color: Color(0xFF5224E3), fontSize: 18),
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
            child: widget.video == false
                ? TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Add question here'),
                  )
                : Column(
                    children: [
                      TextField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Add Caption here'),
                      ),
                      Container(
                        height: size.height * .5,
                        child: pathChosen == false
                            ? Center(
                                child: Text('No image selected'),
                              )
                            : Image.file(
                                File(imagePath),
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            iconSize: 50,
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                            icon: Icon(Icons.photo_album),
                          ),
                          IconButton(
                              iconSize: 50,
                              onPressed: () {
                                getImage(ImageSource.camera);
                              },
                              icon: Icon(
                                Icons.camera_alt_rounded,
                              ))
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
