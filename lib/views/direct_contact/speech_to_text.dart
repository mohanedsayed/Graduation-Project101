import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project101/api/speech_api.dart';

class SpeechToText extends StatefulWidget {
  @override
  _SpeechToTextState createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  bool isListening = false;
  String text = 'Start contacting by pressing \nthe Mic button';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          toggleRecording();
          setState(() {
            isListening = !isListening;
          });
        },
        child: AvatarGlow(
          glowColor: Color(0xFF5224E3),
          animate: isListening,
          endRadius: 70,
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
      ),
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  text,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 70,
            child: !isListening
                ? Icon(
                    Icons.arrow_forward_sharp,
                    size: 60,
                    color: Colors.white,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);

          // if (!isListening) {
          //   Future.delayed(Duration(seconds: 1), () {
          //     // Utils.scanText(text);
          //   });
          // }
        },
      );
}
