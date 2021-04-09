import 'package:moor/moor.dart';

@DataClassName("TDummy")
class TDummies extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get num => integer()();
}
