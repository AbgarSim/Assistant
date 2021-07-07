import 'dart:collection';

import 'package:workmanager/workmanager.dart';

const String _DB_SYNC_UNIQUE_NAME = "dbSyncJobName";
const String _DB_SYNC_TASK_NAME = "dbSyncJob";
const String _DB_SYNC_TAG = "dbSyncTag";

void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) {
    switch (task) {
      case _DB_SYNC_TASK_NAME:
      //TODO excecute task
    }
    return Future.value(true);
  });
}

class DBSyncWorkManager {
  DBSyncWorkManager._();

  static final DBSyncWorkManager jobManager = DBSyncWorkManager._();

  ListQueue<Function> _functionQueue;

  init() {
    _functionQueue = ListQueue(16);

    Workmanager.initialize(
        callbackDispatcher, // The top level function, aka callbackDispatcher
        isInDebugMode:
            true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
  }

  registerDBSyncJob() async {
    Workmanager.registerPeriodicTask(
      _DB_SYNC_UNIQUE_NAME,
      _DB_SYNC_TASK_NAME,
      frequency: Duration(seconds: 30),
      tag: _DB_SYNC_TAG,
    );
  }

  cancelDBSyncTask() async {
    Workmanager.cancelByTag(_DB_SYNC_TAG);
  }

  queueFunction(Function function) async {
    _functionQueue.add(function);
  }

  getQueueFunction() {
    return _functionQueue.removeFirst();
  }
}
