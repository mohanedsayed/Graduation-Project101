import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    maxRadius: 31,
                    child: CircleAvatar(
                      maxRadius: 21,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Text('Jeffery \n  Bizo')
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
              ),
            ],
            options: CarouselOptions(

                // pauseAutoPlayOnManualNavigate: true,
                // pauseAutoPlayInFiniteScroll: true,
                // pauseAutoPlayOnTouch: true,
                initialPage: 3,
                pageSnapping: true,
                enableInfiniteScroll: true,
                height: 120,
                aspectRatio: 0.4,
                viewportFraction: 0.2)),
      ],
    );
  }
}
