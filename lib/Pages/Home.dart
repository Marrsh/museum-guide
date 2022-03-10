import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:museum_guide/Pages/ItemView.dart';
import 'package:museum_guide/httpReq.dart';
import 'package:museum_guide/main.dart';
import 'package:ndef/ndef.dart' as ndef;

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Start"),
                onPressed: () {
                  Navigator.pushNamed(context, '/test');
                },
              ),
              ElevatedButton(
                child: Text("Museum-data"),
                onPressed: () {
                  Navigator.pushNamed(context, '/museum-data');
                },
              ),
              ElevatedButton(
                child: Text("item-view"),
                onPressed: () {
                  Navigator.pushNamed(context, '/item-view');
                },
              ),
              ElevatedButton(
                  child: Text("nfc"),
                  onPressed: () {
                    _tagRead;
                  })
            ])
      ],
    ));
  }

  //nfc
  Future<void> _tagRead() async {
    //add in checks if the tag is not what we are looking for.
    var message;
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      print('tag not accesible');
      // oh-no
    }
    var tag = await FlutterNfcKit.poll(
        timeout: Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag");
    if (tag.ndefAvailable) {
      for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
        message = record;
        // nfcItemId = message.text;
        MuseumData(museumObjectId: message.text);
        ItemView(id: message.text);
        print(message.text);
      }
// Call finish() only once
      await FlutterNfcKit.finish();
// iOS only: show alert/error message on finish
      await FlutterNfcKit.finish(iosAlertMessage: "Success");
// or
      await FlutterNfcKit.finish(iosErrorMessage: "Failed");
    }
  }
}
