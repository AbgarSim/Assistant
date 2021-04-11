import 'package:mobile/application/dummy_dao.dart';
import 'package:mobile/application/moor/infrastructure/moor_db_manager.dart';
import 'package:mobile/model/dummy.dart';

class DummyMoorDao extends DummyDao {
  MoorDatabase _db;


  DummyMoorDao(this._db);

  @override
  Future<bool> createDummy(Dummy dummy) {
    return _db
        .insertDummy(TDummy(id: dummy.id, num: dummy.num))
        .then((value) => true);
  }

  @override
  Future<Dummy> fetchDummy() {
    throw UnimplementedError();
  }

  @override
  Future<List<Dummy>> fetchDummyList() {
    Future<List<TDummy>> allDummies = _db.getAllDummies();
    return allDummies.then((value) => value != null && value.isNotEmpty
        ? value.map((e) => Dummy(id: e.id, num: e.num)).toList()
        : List.empty(growable: true));
  }

  @override
  Future<bool> updateDummy(Dummy dummy) {
    return _db.updateDummy(TDummy(id: dummy.id, num: dummy.num));
  }
}
