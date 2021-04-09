mixin HttpDao {
  String _url = "localhost:8080";

  String get url {
    return _url;
  }

  Map<String, dynamic> headers() {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }
}
