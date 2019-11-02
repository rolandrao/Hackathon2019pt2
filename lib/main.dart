import 'package:hackathon2019pt2/pages/setup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/ui/home/home_page.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}