import 'package:http/http.dart' as http;
import 'package:mobile/application/http/http_dao.dart';

class HearthBeatHttp with HttpDao {
  Future<bool> checkPulse() async {
    var response = await http.get(Uri.http(url, '/hb'));
    return response.statusCode == 200;
  }
}
