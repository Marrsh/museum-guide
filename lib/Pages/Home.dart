import 'dart:async';

import 'package:flutter/material.dart';
import 'package:museum_guide/main.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

// import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
// import 'package:ndef/ndef.dart' as ndef;

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
                child: Text("loaders"),
                onPressed: () {
                  Navigator.pushNamed(context, '/loaders');
                },
              ),
              ElevatedButton(
                child: Text("item-view"),
                onPressed: () {
                  // Navigator.pushNamed(context, '/item-view');
                },
              ),
              ElevatedButton(
                  child: Text("nfc"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/nfc');
                    // NFCReader();
                    // _tagRead;
                  })
            ])
      ],
    ));
  }
}

class NFCReader extends StatefulWidget {
  @override
  _NFCReaderState createState() => _NFCReaderState();
}

class _NFCReaderState extends State {
  bool _supportsNFC = false;
  bool _reading = false;
  late StreamSubscription<NDEFMessage> _stream;

  @override
  void initState() {
    super.initState();
    // Check if the device supports NFC reading
    NFC.isNDEFSupported.then((bool isSupported) {
      setState(() {
        _supportsNFC = isSupported;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_supportsNFC) {
      return RaisedButton(
        child: const Text("You device does not support NFC"),
        onPressed: null,
      );
    }

    return RaisedButton(
        child: Text(_reading ? "Stop reading" : "Start reading"),
        onPressed: () {
          // museumModel itemInfo = getMuseumItemData('co8821096');
          String id = 'test';
          if (_reading) {
            _stream.cancel();
            setState(() {
              _reading = false;
            });
          } else {
            setState(() {
              _reading = true;
              // Start reading using NFC.readNDEF()
              _stream = NFC
                  .readNDEF(
                once: true,
                throwOnUserCancel: false,
              )
                  .listen((NDEFMessage message) {
                print(message.payload);
                // itemInfo = getMuseumItemData(message.data ?? 'co8821096');
                id = message.data!;
                Navigator.pushNamed(context, '/item-view',
                    arguments: ScreenArguments(id));
              }, onError: (e) {
                // Check error handling guide below
              });
            });
          }
        });
  }
}
