import 'package:flutter/material.dart';

class ThreeDots extends StatelessWidget {
  final Function hide;
  final bool hidden = false;
  const ThreeDots({
    Key key,
    this.hide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 120,
          width: size.width * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  hide;
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.not_interested_sharp,
                      size: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Hide',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
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
                    'Report',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(horizontal: 25),
          width: size.width * 0.95,
          height: 60,
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
