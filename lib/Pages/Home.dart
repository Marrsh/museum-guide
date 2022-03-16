import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:museum_guide/Pages/ItemView.dart';
import 'package:museum_guide/httpReq.dart';
import 'package:museum_guide/museumModel.dart';
import 'package:museum_guide/main.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:nfc_manager/nfc_manager.dart';

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
                child: Text("Museum-data"),
                onPressed: () {
                  Navigator.pushNamed(context, '/museum-data');
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
                // ItemView(itemInfo: itemInfo);
                // _stream.cancel();

                // ItemView();
              }, onError: (e) {
                // Check error handling guide below
              });
            });
          }
          // _stream.onDone(() {
          // ItemView(id: id);

          // });
        });
  }
}
//   //nfc
//   Future<void> _tagRead() async {
//     //add in checks if the tag is not what we are looking for.
//     var message;
//     var availability = await FlutterNfcKit.nfcAvailability;
//     if (availability != NFCAvailability.available) {
//       print('tag not accesible');
//       // oh-no
//     }
//     // FlutterNfcKit.
//     var tag = await FlutterNfcKit.poll(
//         timeout: Duration(seconds: 10),
//         iosMultipleTagMessage: "Multiple tags found!",
//         iosAlertMessage: "Scan your tag");
//     if (tag.ndefAvailable) {
//       for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
//         message = record;
//         // nfcItemId = message.text;
//         MuseumData(museumObjectId: message.text);
//         ItemView(id: message.text);
//         print(message.text);
//       }
// // Call finish() only once
//       await FlutterNfcKit.finish();
// // iOS only: show alert/error message on finish
//       await FlutterNfcKit.finish(iosAlertMessage: "Success");
// // or
//       await FlutterNfcKit.finish(iosErrorMessage: "Failed");
//     }
//   }
// }
// class NfcScan extends StatefulWidget {
//   NfcScan({Key? key}) : super(key: key);

//   @override
//   _NfcScanState createState() => _NfcScanState();
// }

// class _NfcScanState extends State<NfcScan> {
//   TextEditingController writerController = TextEditingController();

//   @override
//   initState() {
//     super.initState();
//     writerController.text = 'Flutter NFC Scan';
//     FlutterNfcReader.onTagDiscovered().listen((onData) {
//       print(onData.id);
//       print(onData.content);
//     });
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is removed from the
//     // widget tree.
//     writerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TextField(
//           controller: writerController,
//         ),
//         RaisedButton(
//           onPressed: () {
//             FlutterNfcReader.read();
//           },
//           child: Text("Read"),
//         ),
//         RaisedButton(
//           onPressed: () {
//             FlutterNfcReader.write(" ", writerController.text).then((value) {
//               print(value.content);
//             });
//           },
//           child: Text("Write"),
//         )
//       ],
//     );
//   }
// }
