import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project101/constants/colors.dart';
import 'package:graduation_project101/views/home_page.dart';

import 'views/login/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: iconBackgroundColor,
        primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.red)),
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
