import 'dart:developer';

import 'package:ioc/ioc.dart';
import 'package:mobile/application/dummy_dao_service.dart';
import 'package:mobile/application/http/dummy_http.dart';
import 'package:mobile/application/http/hearth_beat_http.dart';
import 'package:mobile/application/moor/dao/dummy_moore.dart';
import 'package:mobile/application/moor/infrastructure/moor_db_manager.dart';
import 'package:mobile/worker/db_sync_work_manager.dart';

void iocLocator() {
  Ioc().bind(DummyHttpDao, (ioc) => DummyHttpDao(), singleton: true);
  Ioc().bind(HearthBeatHttp, (ioc) => HearthBeatHttp(), singleton: true);

  Ioc().bind(MoorDatabase, (ioc) => MoorDatabase());
  Ioc().bind(DummyMoorDao,
      (ioc) => DummyMoorDao(Ioc().use<MoorDatabase>(MoorDatabase)),
      singleton: true);

  Ioc().bind(
      DummyDaoService,
      (ioc) => DummyDaoService(
          Ioc().use<DummyHttpDao>(DummyHttpDao),
          Ioc().use<HearthBeatHttp>(HearthBeatHttp),
          Ioc().use<DummyMoorDao>(DummyMoorDao),
          DBSyncWorkManager.jobManager),
      singleton: true);
}
