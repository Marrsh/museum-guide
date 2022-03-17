import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'index.dart';
import 'Pages/Home.dart';
import 'Pages/Collection.dart';
import 'Pages/ItemView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //initialise firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/item-view': (context) => const ItemView(),
        '/nfc': (context) => NFCReader(),
        '/home': (context) => MyHomePage(),
        '/test': (context) => Expanded(child: retrieveUserData()),
        '/view-collection': (context) => Collection(),
        '/loaders': (context) => loader(),
      },
      title: 'Museum Guide',
    );
  }
}

class retrieveUserData extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  Widget build(BuildContext context) {
    return (StreamBuilder(
        stream: users,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }
          final data = snapshot.requireData;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Expanded(
                    child: Container(
                        height: height15,
                        width: logicalScreenSize.width / 2,
                        alignment: Alignment.center,
                        color: Colors.yellow,
                        child: Text('${data.docs[index]['username']}')));
              });
        }));
  }
}

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class ScreenArguments {
  final String id;
  ScreenArguments(this.id);
}
