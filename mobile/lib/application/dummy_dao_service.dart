import 'package:mobile/application/dummy_dao.dart';
import 'package:mobile/application/http/dummy_http.dart';
import 'package:mobile/model/dummy.dart';
import 'package:mobile/worker/db_sync_work_manager.dart';

import '../application/http/hearth_beat_http.dart';
import 'moor/dao/dummy_moore.dart';

class DummyDaoService extends DummyDao {
  DummyHttpDao _dummyHttpDao;

  DummyMoorDao _dummyMoorDao;

  HearthBeatHttp _hearthBeatHttp;

  DBSyncWorkManager _dbSyncWorkManager;

  DummyDaoService(this._dummyHttpDao, this._hearthBeatHttp, this._dummyMoorDao,
      this._dbSyncWorkManager);

  @override
  Future<bool> createDummy(Dummy dummy) async {
    var createdDummy = _dummyMoorDao.createDummy(dummy);

    _hearthBeatHttp.checkPulse().then((value) => {
          value
              ? _dummyHttpDao.createDummy(dummy)
              : _dbSyncWorkManager
                  .queueFunction(() => _dummyHttpDao.createDummy(dummy))
        });

    return createdDummy;
  }

  @override
  Future<Dummy> fetchDummy() {
    throw UnimplementedError("ertyuiooiuytr");
  }

  @override
  Future<List<Dummy>> fetchDummyList() {
    return _dummyMoorDao.fetchDummyList();
  }

  @override
  Future<bool> updateDummy(Dummy dummy) {
    var updatedDummy = _dummyMoorDao.updateDummy(dummy);

    _hearthBeatHttp.checkPulse().then((value) => {
          value
              ? _dummyHttpDao.updateDummy(dummy)
              : _dbSyncWorkManager
                  .queueFunction(() => _dummyHttpDao.updateDummy(dummy))
        });

    return updatedDummy;
  }
}
