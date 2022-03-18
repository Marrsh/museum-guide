import 'package:flutter/material.dart';
import 'package:museum_guide/dataController.dart';
import 'package:museum_guide/index.dart';
import 'package:museum_guide/museumModel.dart';
import '../main.dart';

class loader extends StatelessWidget {
  @override
  Widget build(context) {
    return (Container(
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          SizedBox(
            child: CircularProgressIndicator(),
            height: 200.0,
            width: 200.0,
          ),
          SizedBox(
            child: CircularProgressIndicator(),
            height: 50.0,
            width: 50.0,
          ),
          SizedBox(
            child: CircularProgressIndicator(),
            height: 10.0,
            width: 10.0,
          )
        ]))));
  }
}

class ItemView extends StatelessWidget {
  // const ItemView({required this.id});
  // final String id;
  const ItemView({Key? key}) : super(key: key);

  // static const routeName = '/extractArguments';

  @override
  Widget build(context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return FutureBuilder<dynamic>(
        future: getMuseumItemData(args.id),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  title: Text('Item'),
                  backgroundColor: Colors.deepPurple,
                ),
                body: ListView(children: [
                  Image(image: NetworkImage(snapshot.data.image)),
                  Container(
                      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                      //   height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ]),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: Container(
                            width: logicalScreenSize.width,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 2), // changes position of shadow
                                  )
                                ]),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                snapshot.data.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            snapshot.data.exhibit,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            snapshot.data.year,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            snapshot.data.desc,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 14),
                          ),
                        ),
                      ])),
                ]));
          } else {
            return Center(
                child: SizedBox(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
              height: 100.0,
              width: 100.0,
            ));
          }
        });
  }
}
