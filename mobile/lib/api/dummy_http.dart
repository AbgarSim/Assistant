import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/model/dummy.dart';

//TODO move url to property file as well as externalize headers

Future<List<Dummy>> fetchDummyList() async {
  final response = await http.get(Uri.http('localhost:8080', 'dummy/list'));

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    var list = List<Dummy>.from(l.map((model) => Dummy.fromJson(model)));
    list.sort((dum1, dum2) => dum1.id.compareTo(dum2.id));
    return list;
  } else {
    throw Exception('Failed to load dummy');
  }
}

Future<Dummy> fetchDummy() async {
  final response = await http.get(Uri.http('localhost:8080', 'dummy'));

  if (response.statusCode == 200) {
    return Dummy.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load dummy');
  }
}

Future<http.Response> createDummy(Dummy dummy) {
  dummy.id = null;
  return http.post(
    Uri.http('localhost:8080', 'dummy/add'),
    body: jsonEncode(dummy.toJson()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> updateDummy(Dummy dummy) {
  String uri = 'dummy/update/${dummy.id}';
  return http.put(
    Uri.http('localhost:8080', uri),
    body: jsonEncode(dummy.toJson()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
