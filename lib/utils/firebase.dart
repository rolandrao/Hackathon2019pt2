import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


void streamBuilder(){
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;

  void readData() async {
    db.collection('fires').where('id', isEqualTo: "5").snapshots().listen((data) => data.documents.forEach((doc) => print(doc["id"])));
  }

  readData();
  print("done reading data");
}

