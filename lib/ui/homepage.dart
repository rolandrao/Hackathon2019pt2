import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/ui/chatscreen.dart';


class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Chats"),
        ),
        body: new ChatScreen()
    );
  }
}