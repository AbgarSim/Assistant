import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/application/dummy_dao.dart';
import 'package:mobile/application/http/http_dao.dart';
import 'package:mobile/model/dummy.dart';

//TODO move url to property file as well as externalize headers
class DummyHttpDao extends DummyDao with HttpDao {


  Future<List<Dummy>> fetchDummyList() async {
    final response = await http.get(Uri.http(url, 'dummy/list'));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      var list = List<Dummy>.from(l.map((model) => Dummy.fromJson(model)));
      list.sort((dum1, dum2) => dum1.id.compareTo(dum2.id));
      return list;
    } else {
      throw Exception('Failed to load dummy');
    }
  }

  @override
  Future<Dummy> fetchDummy() async {
    final response = await http.get(Uri.http(url, 'dummy'));

    if (response.statusCode == 200) {
      return Dummy.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load dummy');
    }
  }

  @override
  Future<bool> createDummy(Dummy dummy) {
    dummy.id = null;
    Future<http.Response> result = http.post(Uri.http(url, 'dummy/add'),
        body: jsonEncode(dummy.toJson()), headers: headers());
    return result.then((value) => value.statusCode == 200);
  }

  @override
  Future<bool> updateDummy(Dummy dummy) {
    String uri = 'dummy/update/${dummy.id}';
    Future<http.Response> result = http.put(Uri.http(url, uri),
        body: jsonEncode(dummy.toJson()), headers: headers());
    return result.then((value) => value.statusCode == 200);
  }

  @override
  Future<List<Dummy>> fethDummyList() {
    // TODO: implement fethDummyList
    throw UnimplementedError();
  }

}
