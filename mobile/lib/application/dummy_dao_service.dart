import 'package:mobile/application/dummy_dao.dart';
import 'package:mobile/application/http/dummy_http.dart';
import 'package:mobile/model/dummy.dart';
import 'package:mobile/worker/db_sync_work_manager.dart';

import '../application/http/hearth_beat_http.dart';
import 'moor/dao/dummy_moore.dart';

class DummyDaoService extends DummyDao {
  //TODO make these private
  DummyHttpDao dummyHttpDao;

  DummyMoorDao dummyMoorDao;

  HearthBeatHttp hearthBeatHttp;

  DBSyncWorkManager dbSyncWorkManager;

  DummyDaoService(this.dummyHttpDao, this.hearthBeatHttp, this.dummyMoorDao,
      this.dbSyncWorkManager);

  @override
  Future<bool> createDummy(Dummy dummy) async {
    var createdDummy = dummyMoorDao.createDummy(dummy);

    hearthBeatHttp.checkPulse().then((value) => {
          value
              ? dummyHttpDao.createDummy(dummy)
              : dbSyncWorkManager
                  .queueFunction(() => dummyHttpDao.createDummy(dummy))
        });

    return createdDummy;
  }

  @override
  Future<Dummy> fetchDummy() {
    throw UnimplementedError("ertyuiooiuytr");
  }

  @override
  Future<List<Dummy>> fetchDummyList() {
    return dummyMoorDao.fetchDummyList();
  }

  @override
  Future<bool> updateDummy(Dummy dummy) {
    var updatedDummy = dummyMoorDao.updateDummy(dummy);

    hearthBeatHttp.checkPulse().then((value) => {
          value
              ? dummyHttpDao.updateDummy(dummy)
              : dbSyncWorkManager
                  .queueFunction(() => dummyHttpDao.updateDummy(dummy))
        });

    return updatedDummy;
  }
}
