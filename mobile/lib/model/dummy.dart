

class Dummy {
  static List<String> columns() {
    return ["id", "num"];
  }

  int id;
  int num;

  Dummy({int id, int num}) {
    this.id = id;
    this.num = num;
  }

  //TODO refactor this to serialize automatically
  factory Dummy.fromJson(Map<String, dynamic> json) {
    return Dummy(
      id: json['id'],
      num: json['num'],
    );
  }

  //TODO refactor this to serialize automatically
  Map<String, dynamic> toJson() => {'id': '$id', 'num': '$num'};

  factory Dummy.fromArguments(int id, int num) {
    return Dummy(id: id, num: num);
  }
}




