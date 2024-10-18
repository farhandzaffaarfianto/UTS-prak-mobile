import 'package:flutter/material.dart';
import 'home_page.dart';
import 'explore_page.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Application',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: {
        '/explore': (context) => ExplorePage(),
      },
    );
  }
}
