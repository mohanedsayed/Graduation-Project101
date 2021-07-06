import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation_project101/constants/colors.dart';
import 'package:graduation_project101/views/landing_page.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({
    Key key,
  }) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
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

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: SingleChildScrollView(
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
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Post',
                            style: TextStyle(
                                color: primaryColor.withOpacity(.5),
                                fontSize: 18),
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
                  child:
                      // widget.video == false
                      // ? TextField(
                      //     cursorColor: Colors.black,
                      //     keyboardType: TextInputType.text,
                      //     decoration: new InputDecoration.collapsed(
                      //         hintText: 'Add question here'),
                      //   )
                      // :
                      Column(
                    children: [
                      TextField(
                        style: TextStyle(color: fadedTextColor),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Add Caption here'),
                      ),
                      Container(
                        height: size.height * .5,
                        child: pathChosen == false
                            ? Center(
                                child: Text(''),
                              )
                            : Image.file(
                                File(imagePath),
                              ),
                      ),
                      SizedBox.fromSize(
                        size: size * 0.15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              // barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => Column(
                                children: [
                                  // Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 120,
                                    width: size.width * 0.95,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              getImage(ImageSource.gallery),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.photo,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Gallery',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              getImage(ImageSource.camera),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.flag_outlined,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Camera',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius:
                                  //           BorderRadius.circular(16)),
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 25),
                                  //   width: size.width * 0.95,
                                  //   height: 60,
                                  //   child: Center(
                                  //     child: GestureDetector(
                                  //       onTap: () => Navigator.pop(context),
                                  //       child: Text(
                                  //         'Cancel',
                                  //         style: TextStyle(
                                  //             color: Colors.red,
                                  //             fontSize: 20,
                                  //             fontWeight:
                                  //                 FontWeight.normal),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 40,
                                  // ),
                                ],
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  color: iconBackgroundColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.photo,
                                    color: primaryColor,
                                    size: 40,
                                  ),
                                  SizedBox(width: 5),
                                  Text('Add Photo'),
                                ],
                              ),
                            ),
                          )
                          // Card(
                          //   child: Row(
                          //     children: [
                          //       Text('Add photo'),
                          //       IconButton(
                          //         iconSize: 50,
                          //         onPressed: () {
                          //           getImage(ImageSource.gallery);
                          //         },
                          //         icon: Icon(Icons.photo),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          ,
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              // barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 120,
                                    width: size.width * 0.95,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              getVideo(ImageSource.gallery),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.photo,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Gallery',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              getVideo(ImageSource.camera),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.flag_outlined,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Camera',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius:
                                  //           BorderRadius.circular(16)),
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 25),
                                  //   width: size.width * 0.95,
                                  //   height: 60,
                                  //   child: Center(
                                  //     child: GestureDetector(
                                  //       onTap: () => Navigator.pop(context),
                                  //       child: Text(
                                  //         'Cancel',
                                  //         style: TextStyle(
                                  //             color: Colors.red,
                                  //             fontSize: 20,
                                  //             fontWeight:
                                  //                 FontWeight.normal),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 40,
                                  // ),
                                ],
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  color: iconBackgroundColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.videocam,
                                    color: primaryColor,
                                    size: 40,
                                  ),
                                  SizedBox(width: 5),
                                  Text('Add video'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
