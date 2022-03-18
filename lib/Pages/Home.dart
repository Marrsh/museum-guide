import 'dart:async';

import 'package:flutter/material.dart';
import 'package:museum_guide/index.dart';
import 'package:museum_guide/main.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

// import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
// import 'package:ndef/ndef.dart' as ndef;

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                Icons.museum_outlined,
                color: Colors.deepPurple,
                size: 136.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Text(
                'Museum Guide',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                    child: Container(
                        alignment: Alignment.center,
                        width: logicalScreenSize.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text('Scan an Item',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center),
                            Spacer(),
                            Icon(
                              Icons.contactless,
                              // color: Colors.deepPurple,
                              size: 36.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, '/nfc');
                    },
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                    child: Container(
                        alignment: Alignment.center,
                        width: logicalScreenSize.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text('View Collection',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center),
                            Spacer(),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              // color: Colors.deepPurple,
                              size: 36.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ],
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, '/view-collection');
                    },
                  )),
              Spacer(),
            ])
      ],
    )));
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

  String id = 'test';

  @override
  Widget build(BuildContext context) {
    if (!_supportsNFC) {
      return RaisedButton(
        child: const Text("Your device does not support NFC"),
        onPressed: null,
      );
    }
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
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.s,
            children: [
              Spacer(),
              IconButton(
                onPressed: () {
                  if (_reading) {
                    _stream.cancel();
                    setState(() {
                      _reading = false;
                    });
                    Navigator.pushNamed(context, '/home');
                  }
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  // size: 76.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                iconSize: 76,
              ),
              Spacer(),
              Center(child: nfcScanning()),
              Text(
                'Scanning for NFC tag',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Spacer(),
              Spacer(),
            ]));
  }
}

class nfcScanning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
      height: 100.0,
      width: 100.0,
    ));
  }
}
