import 'dart:collection';
import 'dart:convert' as cnv;
import 'package:http/http.dart' as http;
import 'museumModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getMuseumItemData(String id) async {
  museumModel item;
  var collection = FirebaseFirestore.instance.collection('items_collected');
  var querySnapshot = await collection.where('id', isEqualTo: id).get();
  if (querySnapshot.docs.isEmpty) {
    http.Response res = await http.get(
        Uri.parse('https://collection.sciencemuseumgroup.org.uk/objects/' + id),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        });
    LinkedHashMap<String, dynamic> body = cnv.jsonDecode(res.body);
    item = museumModel(
        museum: body['data']['attributes']['categories'][0]['museum'],
        title: body['data']['attributes']['summary_title'],
        year: body['data']['attributes']['lifecycle']['creation'][0]['date'][0]
            ['value'],
        image: body['data']['attributes']['multimedia'][0]['processed']
            ['large_thumbnail']['location'],
        exhibit: body['data']['attributes']['categories'][0]['name'],
        desc: body['data']['attributes']['description'][1]['value'],
        id: id);
    uploadItem(item);
  } else {
    Map<String, dynamic> data = querySnapshot.docs[0].data();
    item = museumModel(
        museum: data['museum'],
        title: data['title'],
        year: data['year'],
        image: data['image'],
        exhibit: data['exhibit'],
        desc: data['desc'],
        id: id);
  }
  return item;
}

Future<dynamic> museumItemExists(String id) async {}

Future<void> uploadItem(museumModel item) {
  CollectionReference items =
      FirebaseFirestore.instance.collection('items_collected');
  String state = '';
  return items
      .doc()
      .set({
        'desc': item.desc,
        'exhibit': item.exhibit,
        'id': item.id,
        'image': item.image,
        'museum': item.museum,
        'title': item.title,
        'year': item.year
      })
      .then((value) => state = 'data added')
      .catchError((error) => state = 'error $error');
}
