import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
