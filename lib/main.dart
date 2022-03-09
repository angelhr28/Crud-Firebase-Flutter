import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String uid = '';

  MyApp({Key? key}) : super(key: key);

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Initialized default app $app');
  }

  void insert() {
    FirebaseFirestore.instance.collection('users').add({
      'name': 'Angel',
      'surname': 'Huamanñahui',
    }).then((value) => {uid = value.id});
    print('Insert Element');
  }

  Future<void> update() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection.doc(uid).update(
        {'name': 'Angel', 'surname': 'Huamanñahui', 'mothername': 'Robles'});
    print('Update Element');
  }

  Future<void> delete() async {
    var collection = FirebaseFirestore.instance.collection('users');
    collection.doc(uid).delete().whenComplete(() => get());
    print('Delete Element');
  }

  Future<void> get() async {
    var collection = FirebaseFirestore.instance.collection('users');
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        collection.snapshots();

    var list = await snapshot.first;

    for (var element in list.docs) {
      print('ID ${element.id}');
      print('Get Element NAME ${element['name']}');
      print('Get Element SURNAME ${element['surname']}');
    }
    uid = list.docs.last.id;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Core example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: initializeDefault,
                child: const Text('Initialize default app'),
              ),
              ElevatedButton(
                onPressed: get,
                child: const Text('Get'),
              ),
              ElevatedButton(
                onPressed: insert,
                child: const Text('Insert'),
              ),
              ElevatedButton(
                onPressed: update,
                child: const Text('Update'),
              ),
              ElevatedButton(
                onPressed: delete,
                child: const Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
