import 'package:flutter/material.dart';

class DirectContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF707070),
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 10,
            child: IconButton(
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () => Navigator.pop(context)),
          ),
          Positioned(
            top: 350,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Start contacting by pressing \nthe Mic button',
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              left: 70,
              child: Icon(
                Icons.arrow_forward_sharp,
                size: 60,
                color: Colors.white,
              )),
          Positioned(
            bottom: 50,
            left: 180,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.mic,
                color: Color(0xFF5224E3),
                size: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
