import 'package:mobile/application/dummy_dao.dart';
import 'package:mobile/application/moor/infrastructure/moor_db_manager.dart';
import 'package:mobile/model/dummy.dart';

class DummyMoorDao extends DummyDao {
  @override
  Future<bool> createDummy(Dummy dummy) {
    return MoorDatabase()
        .insertDummy(TDummy(id: dummy.id, num: dummy.num))
        .then((value) => true);
  }

  @override
  Future<Dummy> fetchDummy() {
    throw UnimplementedError();
  }

  @override
  Future<List<Dummy>> fetchDummyList() {
    return MoorDatabase().getAllDummies().then(
        (value) => value.map((e) => Dummy(id: e.id, num: e.num)).toList());
  }

  @override
  Future<bool> updateDummy(Dummy dummy) {
    return MoorDatabase().updateDummy(TDummy(id: dummy.id, num: dummy.num));
  }
}
