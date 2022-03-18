import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:museum_guide/index.dart';
import 'package:museum_guide/main.dart';

class Collection extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('items_collected').snapshots();
  Widget build(BuildContext context) {
    return (StreamBuilder(
        stream: users,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Column(
              children: [
                SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                  height: 50.0,
                  width: 50.0,
                ),
                Text(
                  'Fetching data',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ));
          }
          final data = snapshot.requireData;
          return Scaffold(
              appBar: AppBar(
                title: Text('Collection'),
                backgroundColor: Colors.deepPurple,
              ),
              body: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                  ),
                  itemCount: data.size,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent[600]),
                            onPressed: (() {
                              Navigator.pushNamed(context, '/item-view',
                                  arguments:
                                      ScreenArguments(data.docs[index]['id']));
                            }),
                            child: Container(
                                child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                      width: logicalScreenSize.width / 3,
                                      image: NetworkImage(
                                          '${data.docs[index]['image']}'))),
                              Text(
                                '${data.docs[index]['title']}',
                                style: TextStyle(fontSize: 14),
                              )
                            ]))));
                  }));
        }));
  }
}
