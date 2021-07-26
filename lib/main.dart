import 'package:flutter/material.dart';
import 'package:tinder_cards/login.dart';
import 'swipe_feed_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divine test',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Quicksand'),
      home: LoginPage(),
    );
  }
}
