import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon2019pt2/Emergency.dart';
import 'package:hackathon2019pt2/Social.dart';
import 'package:hackathon2019pt2/config/config_bloc.dart';
import 'package:hackathon2019pt2/main.dart';
import 'package:hackathon2019pt2/universal/dev_scaffold.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:hackathon2019pt2/utils/readCSV.dart';
import 'package:flutter/cupertino.dart';
import "package:dio/dio.dart";
import 'package:hackathon2019pt2/map.dart';

const apiKey = "AIzaSyAxR68m3rpaOKaUHtsRSaV7NWYVMzv2kPM";
const lat = 34.068797;
const lng = -118.444789;

var places = new List<Place>();
var markers = new List<Marker>();

class MapPage2 extends StatefulWidget {
  static const String routeName = "/map";
  @override
  _MapPageState2 createState() => _MapPageState2();
}

class Place {

  var lat;
  var lng;
  String name;

  Place(lat, lng, name) {
    this.lat = lat;
    this.lng = lng;
    this.name = name;
  }


}

class _MapPageState2 extends State<MapPage2> {
  GoogleMapController _controller;
  bool isMapCreated = false;
  static final LatLng myLocation = LatLng(lat, lng);

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    searchNearby('hospital');
    for(int i = 0; i < places.length; i++){
      //print(places[i].name);
      markers.add(new Marker(

        markerId: MarkerId(places[i].name),
        position: LatLng(double.parse(places[i].lat),double.parse(places[i].lng)),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ),
        infoWindow: InfoWindow(title: places[i].name, snippet: ''),
        onTap:() {
          //_onMarkerTapped(markerId);
        },
      ));
    }

//for(int i = 0; i < places.length)
    searchNearby('police');
    for(int i = markers.length; i < places.length; i++){
      //print(places[i].name);
      markers.add(new Marker(

        markerId: MarkerId(places[i].name),
        position: LatLng(double.parse(places[i].lat),double.parse(places[i].lng)),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
        infoWindow: InfoWindow(title: places[i].name, snippet: ''),
        onTap:() {
          //_onMarkerTapped(markerId);
        },
      ));
    }
    for(int i = 0; i < places.length; i++) {
      print(places[i].name + "\n");

    }

//for(int i = 0; i < places.length)


    print(markers);
  }



  Future searchNearby(String keyword) async {
    Response response;
    var l = new List();
    var ln = new List();
    var name = new List();
    var dio = Dio();
    var url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
    var parameters = {
      'key': 'AIzaSyAxR68m3rpaOKaUHtsRSaV7NWYVMzv2kPM',
      'location': '$lat, $lng',
      'radius': '10000',
      'type': keyword,
    };
    response = await dio.get(url, queryParameters:parameters);
    l = response.data['results'].map<String>((result) =>
        result['geometry']['location']['lat'].toString()).toList();
    ln = response.data['results'].map<String>((result) =>
        result['geometry']['location']['lng'].toString()).toList();
    name = response.data['results'].map<String>((result) =>
        result['name'].toString()).toList();


    for(int i = 0; i < l.length; i++){
      places.add(new Place(l[i],ln[i],name[i]));
    }

  }


  final CameraPosition _kGooglePlex = CameraPosition(
    target: myLocation,
    zoom: 14.4746,
  );

  void newTextBox() {
    Widget build(BuildContext context) {

    }
  }
  Set<Marker> _createMarker() {
    return markers.toSet();
  }


  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
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
      title: Text("Location"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            print("running getData");
            //getData();
          },
        )
      ],
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _createMarker(),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                isMapCreated = true;
                setState(() {});
              },
            ),
            IgnorePointer(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "University of California, Los Angeles\n",
                        style: Theme.of(context).textTheme.title.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: "Los Angeles, CA",
                              style: Theme.of(context).textTheme.subtitle,
                              children: []),
                        ]),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: makeBottom,
      appBar: topAppBar,
    );
  }

}

Widget _buildAboutDialog(BuildContext context, String name) {
  return new AlertDialog(
    title: Text(name),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Okay, got it!'),
      ),
    ],
  );
}