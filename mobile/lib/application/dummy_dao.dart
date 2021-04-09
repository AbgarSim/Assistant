import 'package:mobile/model/dummy.dart';

abstract class DummyDao {
  Future<List<Dummy>> fetchDummyList();

  Future<Dummy> fetchDummy();

  Future<bool> updateDummy(Dummy dummy);

  Future<bool> createDummy(Dummy dummy);
}
