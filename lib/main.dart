
import 'package:hackathon2019pt2/EarthQuakeTips.dart';
import 'package:hackathon2019pt2/Emergency.dart';
import 'package:hackathon2019pt2/Social.dart';
import 'package:hackathon2019pt2/map.dart';
import 'package:hackathon2019pt2/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/detail_page.dart';
import 'package:hackathon2019pt2/tornado.dart';
import 'package:hackathon2019pt2/tsunami.dart';
import 'package:hackathon2019pt2/ui/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:hackathon2019pt2/wildfire.dart';

void main() => runApp(new MyApp());

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project




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
  Color col1 = Color.fromRGBO(72, 126, 176,1);
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
      subtitle: Text("                                                                             " +lesson.content, style: TextStyle(color: Colors.white, fontSize: 13, fontWeight:  FontWeight.bold), textAlign: TextAlign.center,),

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
              decoration: BoxDecoration(color: Color.fromRGBO(72, 126, 176,1), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Natural Disasters Near You",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.black,
                  content: "No Disasters Near By.  "), MaterialPageRoute(
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
              decoration: BoxDecoration(color: Color.fromRGBO(72, 126, 176,1), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Tsunami",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: ""), MaterialPageRoute(
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
              decoration: BoxDecoration(color:  Color.fromRGBO(72, 126, 176,1), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Earth Quake",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: ""), MaterialPageRoute(
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
              decoration: BoxDecoration(color:  Color.fromRGBO(72, 126, 176,1), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Tornado",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: ""), MaterialPageRoute(
                  builder: (context) => Tornado())
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
              decoration: BoxDecoration(color: Color.fromRGBO(72, 126, 176,1), borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Forest Fire",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content: ""), MaterialPageRoute(
                  builder: (context) => Fire())
              )
          ),
        ),



      ],


    );


    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(25, 42, 86,1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );


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
                  MaterialPageRoute(builder: (context) => Social()),
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
      backgroundColor: Color.fromRGBO(25, 42, 86,1),
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

      backgroundColor: Color.fromRGBO(25, 42, 86,1),
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
        ""),
    Lesson(
        title: "Tsunami",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 50,
        content:
        ""),
  ];
}

