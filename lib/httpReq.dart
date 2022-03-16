import 'dart:async';
import 'dart:collection';
import 'dart:convert' as cnv;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:museum_guide/Pages/ItemView.dart';
import 'museumModel.dart';

getMuseumItemData(String id) async {
  Uri url = Uri.https('collection.sciencemuseumgroup.org.uk',
      '/search/museum/science-museum?page[size]=5');
  http.Response res = await http.get(
      Uri.parse('https://collection.sciencemuseumgroup.org.uk/objects/' + id),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
  LinkedHashMap<String, dynamic> body = cnv.jsonDecode(res.body);

  return (museumModel(
      museum: body['data']['attributes']['categories'][0]['museum'],
      title: body['data']['attributes']['summary_title'],
      year: body['data']['attributes']['lifecycle']['creation'][0]['date'][0]
          ['value'],
      image: body['data']['attributes']['multimedia'][0]['processed']
          ['large_thumbnail']['location'],
      exhibit: body['data']['attributes']['categories'][0]['name'],
      desc: body['data']['attributes']['description'][1]['value'],
      id: id));
}
