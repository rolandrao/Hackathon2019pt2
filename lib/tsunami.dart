
import 'package:hackathon2019pt2/EarthQuakeTips.dart';
import 'package:hackathon2019pt2/Emergency.dart';
import 'package:hackathon2019pt2/main.dart';
import 'package:hackathon2019pt2/map.dart';
import 'package:hackathon2019pt2/model/lesson.dart';
import 'package:hackathon2019pt2/model/Card2.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/detail_page.dart';
import 'package:hackathon2019pt2/ui/home/home_page.dart';


class Tsunami extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Emergency',

      home: new TsunamiPage(title: 'Lessons'),
      // home: DetailPage(),
    );
  }
}

class TsunamiPage extends StatefulWidget {
  TsunamiPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TsunamiState createState() => _TsunamiState();
}

class _TsunamiState extends State<TsunamiPage> {
  List lessons;
  List Cards;

  Color col = Color.fromRGBO(162, 155, 254, 1.0);
  @override
  void initState() {
    lessons = getLessons();
    Cards = getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson, MaterialPageRoute k) => ListTile(

      title: Text(
        "                                                                " + lesson.title,
        style: TextStyle(color: lesson.colorTitle, fontWeight: FontWeight.bold, fontSize: 18, ),
        textAlign: TextAlign.center,
      ),
      subtitle: Text(lesson.content, style: TextStyle(color: lesson.colorSub, fontSize: 16, fontWeight:  FontWeight.bold)),

      onTap: () {
      },
    );
    ListTile makeListTileCards(Card2 Card) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        Card.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage()));
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
              height: 100,
              decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Get to high ground, as far inland as possible",
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content:"" ), MaterialPageRoute(
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
              decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "Watch for sudden rises or draining of ocean water",
                  level: "-Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub:  Colors.white,
                  content:
                  " "), MaterialPageRoute(
                  builder: (context) => MapPage()))
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
              decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "EVACUATE DO NOT WAIT",
                  level: "Category 3",
                  indicatorValue: 0.0,
                  price: 20,
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content:
                  ""),MaterialPageRoute(
                  builder: (context) => EarthQuake()))
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
              decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "If you're on a boat, go out to sea",
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content:"" ), MaterialPageRoute(
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
              decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(25)),
              child: makeListTile(Lesson(
                  title: "listen to loal alerts",
                  colorTitle: Colors.white,
                  colorSub: Colors.white,
                  content:"" ), MaterialPageRoute(
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
              onPressed: () {},
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
      title: Text("Earthquake",
        style: TextStyle(color: Colors.white),), centerTitle: true, toolbarOpacity: 1.0,
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
        title: "Earth Quake",
        level: "Category 3",
        indicatorValue: 0.0,
        price: 20,
        content: "Category 3                     Aftershock predicted to hit in 1 hour"),
    Lesson(
        title: "Tsunami",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
  ];
}
