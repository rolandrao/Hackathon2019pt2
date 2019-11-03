import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/ui/chatmessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:hackathon2019pt2/Social.dart';

final db = Firestore.instance;
String id;

class ChatScreen extends StatefulWidget {

  @override
  State createState() => new ChatScreenState();
}
var data = new List();
class ChatScreenState extends State<ChatScreen> {

  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];


  void _restoreMessage() {
    for(int i = 0; i < data.length; i++){
      ChatMessage message = new ChatMessage(
          text: data[i]['message']
      );

      setState(() {
        _messages.insert(data[i]['name'], message);
      });
    }
  }

  void _handleSubmit(String text) {
    _uploadMessage(text);
    _chatController.clear();
    ChatMessage message = new ChatMessage(
        text: text
    );

    setState(() {
      _messages.insert(0, message);
    });

  }

  @override
  void initState() {
    Firestore.instance.collection('forum').getDocuments().then((
        QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
  });

    print(data);
      }

  void _uploadMessage(String text) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMddhhmmss').format(now);
    Firestore.instance.collection('forum').document(formattedDate)
        .setData({ 'message': text, 'name': name});

  }

  Widget _chatEnvironment (){
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Starts typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),

                onPressed: ()=> _handleSubmit(_chatController.text),

              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(decoration: new BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
          child: _chatEnvironment(),),
        StreamBuilder<QuerySnapshot> (
          stream: db.collection('forum').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Firestore.instance.collection('forum').getDocuments().then((
                  QuerySnapshot snapshot) {
                snapshot.documents.forEach((f) => print('${f.data}}'));
              });
              return Text(
                'No Data...',
              );
            } else {
              return Text(
                'No Data...',
              );
            }
          },
        )
      ],
    );
  }
}

void readData() async {
  DocumentSnapshot snapshot = await db.collection('forum').document(id).get();
  //print(snapshot.data['name']);
}