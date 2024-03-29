
import 'package:hackathon2019pt2/Emergency.dart';
import 'package:hackathon2019pt2/map.dart';
import 'package:hackathon2019pt2/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/detail_page.dart';
import 'package:hackathon2019pt2/pages/home.dart';
import 'package:hackathon2019pt2/ui/homepage.dart';
import 'package:dio/dio.dart';
import 'package:hackathon2019pt2/utils/home.dart';

var name;

class Social extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chat',

      home: new SocialPage(title: 'Lessons'),
      // home: DetailPage(),
    );
  }
}

class SocialPage extends StatefulWidget {
  SocialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  List lessons;
  final myController = TextEditingController();

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 42, 86,1),
        title: Text('Enter your name:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          style: new TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        backgroundColor: Color.fromRGBO(25, 42, 86,1),
        onPressed: () {
          name = myController.text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirestoreCRUDPage()),
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
      backgroundColor: Color.fromRGBO(25, 42, 86,1),
    );
  }
}


