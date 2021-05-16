import 'package:flutter/material.dart';
import 'package:graduation_project101/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: Theme(data: data, child: child),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
