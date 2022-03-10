import 'dart:async';
import 'dart:collection';
import 'dart:convert' as cnv;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:museum_guide/Pages/ItemView.dart';
import 'museumModel.dart';

// import 'm';
class MuseumData extends StatefulWidget {
  const MuseumData({required this.museumObjectId});
  final String museumObjectId;
  @override
  _MuseumDataState createState() =>
      _MuseumDataState(museumObjectId: museumObjectId);
}

class _MuseumDataState extends State<MuseumData> {
  _MuseumDataState({required this.museumObjectId});
  final String museumObjectId;
  @override
  void initState() {
    getData(museumObjectId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (ItemView(
      id: museumObjectId,
    ));
    // TODO: implement build
    // throw UnimplementedError();
  }
}

Future<http.Response> getData(String id) async {
  Uri url = Uri.https('collection.sciencemuseumgroup.org.uk',
      '/search/museum/science-museum?page[size]=5');
  http.Response res = await http.get(
      Uri.parse('https://collection.sciencemuseumgroup.org.uk/objects/' + id),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
  String jsonStr = res.body;
  // Map<String, dynamic> d = json.decode(jsonStr.trim());
  LinkedHashMap<String, dynamic> body = cnv.jsonDecode(res.body);
  String firstTitle = body['data'][0]['attributes']['summary_title'];
  title = firstTitle;

  // museumModel(title: firstTitle,)
  // model = body
  //     .map((string data, dynamic items) => museumModel.fromJson(items))
  //     .toList();
  return res;
  // print(res.body);
}
