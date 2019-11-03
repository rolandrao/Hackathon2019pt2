
import 'package:hackathon2019pt2/EarthQuakeTips.dart';
import 'package:hackathon2019pt2/Emergency.dart';
import 'package:hackathon2019pt2/Social.dart';
import 'package:hackathon2019pt2/map.dart';
import 'package:hackathon2019pt2/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/detail_page.dart';
import 'package:hackathon2019pt2/tsunami.dart';
import 'package:hackathon2019pt2/ui/home/home_page.dart';
import 'package:dio/dio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',

      home: new ListPage(title: 'Lessons'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson, MaterialPageRoute k) => ListTile(
      title: Text(
       "                                                                            " + lesson.title,
        style: TextStyle(color: lesson.colorTitle, fontWeight: FontWeight.bold, fontSize: 21), textAlign: TextAlign.center,
      ),
      //subtitle: Text(lesson.content, style: TextStyle(color: lesson.colorSub, fontSize: 16, fontWeight:  FontWeight.bold)),

      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            k);
      },
    );
    ListView makeBody() => ListView
      (
      children: <Widget>[
        Card(
          elevation: 15.0,
          margin: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child:
          Container(
              width: 200,
              height: 285,
              decoration: BoxDecoration(color: Color.fromRGBO(87, 96, 111, 1.0), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Natural Disasters Near You",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.black,
                  content: "                           Category 3                             Aftershock predicted to hit in 1 hour"), MaterialPageRoute(
                  builder: (context) => ListPage())
              )
          ),
        ),
        Card(
          elevation: 15.0,
          margin: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child:
          Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(color: Color.fromRGBO(116, 185, 255, 1.0), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Tsunami",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: "                           Category 3                             Aftershock predicted to hit in 1 hour"), MaterialPageRoute(
                  builder: (context) => Tsunami())
              )
          ),
        ),
        Card(
          elevation: 15.0,
          margin: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child:
          Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(color: Color.fromRGBO(116, 185, 255, 1.0), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Earth Quake",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: "                           Category 3                             Aftershock predicted to hit in 1 hour"), MaterialPageRoute(
                  builder: (context) => EarthQuake())
              )
          ),

        ),Card(
          elevation: 15.0,
          margin: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child:
          Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(color: Color.fromRGBO(116, 185, 255, 1.0), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Tornado",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: "                           Category 3                             Aftershock predicted to hit in 1 hour"), MaterialPageRoute(
                  builder: (context) => ListPage())
              )
          ),
        ),
        Card(
          elevation: 15.0,
          margin: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child:
          Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(color: Color.fromRGBO(116, 185, 255, 1.0), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Forest Fire",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: "                           Category 3                             Aftershock predicted to hit in 1 hour"), MaterialPageRoute(
                  builder: (context) => ListPage())
              )
          ),
        ),



      ],


    );


    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {

              },

            ),
            IconButton(
              icon: Icon(Icons.map, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmergencyPage()),
                );

              },
            ),
            IconButton(
              icon: Icon(Icons.warning, color: Colors.white),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmergencyPage()),
                );

              },
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text("📍Troy, NY"), centerTitle: true, toolbarOpacity: 1.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {


          },
        )
      ],
    );

    return Scaffold(

      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody(),
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Troy, NY",
        level: "Beginner",
        indicatorValue: 0.0,
        price: 20,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Tsunami",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
  ];
}


