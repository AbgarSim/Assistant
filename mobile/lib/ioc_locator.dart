import 'package:ioc/ioc.dart';
import 'package:mobile/application/dummy_dao_service.dart';
import 'package:mobile/application/http/dummy_http.dart';
import 'package:mobile/application/http/hearth_beat_http.dart';
import 'package:mobile/application/moor/dao/dummy_moore.dart';
import 'package:mobile/worker/db_sync_work_manager.dart';

void iocLocator() {
  Ioc().bind(DummyHttpDao, (ioc) => DummyHttpDao(), singleton: true);
  Ioc().bind(HearthBeatHttp, (ioc) => HearthBeatHttp(), singleton: true);
  Ioc().bind(DummyMoorDao, (ioc) => DummyMoorDao(), singleton: true);
  Ioc().bind(
      DummyHttpDao,
      (ioc) => DummyDaoService(
          Ioc().use<DummyHttpDao>(DummyHttpDao),
          Ioc().use<HearthBeatHttp>(HearthBeatHttp),
          Ioc().use<DummyMoorDao>(DummyMoorDao),
          DBSyncWorkManager.jobManager));
}
