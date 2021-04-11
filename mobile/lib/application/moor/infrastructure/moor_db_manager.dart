import 'dart:io';

import 'package:mobile/application/moor/infrastructure/t_dummy.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'moor_db_manager.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

/// Use flutter packages pub run build_runner built
@UseMoor(tables: [TDummies])
class MoorDatabase extends _$MoorDatabase {
  // we tell the database where to store the data with this constructor
  MoorDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<List<TDummy>> getAllDummies() => select(tDummies).get();

  Future insertDummy(TDummy dummy) => into(tDummies).insert(dummy);

  Future updateDummy(TDummy dummy) => update(tDummies).replace(dummy);
}
