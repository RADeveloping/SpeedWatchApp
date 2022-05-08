import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/collections/record_collection.dart';

import '../collections/session_collection.dart';
import '../collections/settings_collection.dart';
import '../controllers/sidebar_controller.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';

class DbService extends GetxService {
  Future<DbService> init() async {
    final dir = await getApplicationSupportDirectory();
    final Isar isar = await Isar.open(
      schemas: [
        SessionCollectionSchema,
        SettingsCollectionSchema,
        RecordCollectionSchema
      ],
      directory: dir.path,
      inspector: true,
    ).then((db) {
      SidebarController s = Get.find();
      getSessions(s.handleNewSessions, db);
      setSessionsListener(s.handleNewSessions, db);
      setRecordsListener(s.handleNewRecords, s.handleDeletedRecords, db);
      return db;
    });
    Get.put(isar, permanent: true);
    return this;
  }

  void setSessionsListener(Function handleNewSession, Isar db) async {
    Stream<void> sessionsChanged = db.sessionCollections.watchLazy();
    sessionsChanged.listen((s) {
      getSessions(handleNewSession, db);
    });
  }

  void setRecordsListener(
      Function handleNewRecords, Function handleDeletedRecords, Isar db) async {
    Stream<void> recordsChanged = db.recordCollections.watchLazy();
    recordsChanged.listen((s) {
      getRecords(handleNewRecords, db);
      getDeletedRecords(handleDeletedRecords, db);
    });
  }

  void getRecords(Function handleNewRecords, Isar db) async {
    int currentSessionId =
        int.parse(await Get.parameters['sessionID'] as String);
    db.recordCollections
        .where()
        .deletedAtIsNull()
        .filter()
        .sessionIdEqualTo(currentSessionId)
        .sortByCreatedAtDesc()
        .findAll()
        .then((newRecords) => handleNewRecords(newRecords));
  }

  void getRecordsWithId(Function handleNewRecords, int currentSessionId,
      Function callBack) async {
    Isar db = Get.find();

    db.recordCollections
        .where()
        .deletedAtIsNull()
        .filter()
        .sessionIdEqualTo(currentSessionId)
        .sortByCreatedAtDesc()
        .findAll()
        .then((newRecords) {
      handleNewRecords(newRecords);
      callBack();
    });
  }

  void getDeletedRecords(Function handleDeletedRecords, Isar db) async {
    int currentSessionId =
        int.parse(await Get.parameters['sessionID'] as String);
    db.recordCollections
        .where()
        .deletedAtIsNotNull()
        .filter()
        .sessionIdEqualTo(currentSessionId)
        .sortByDeletedAtDesc()
        .findAll()
        .then(
            (recordsToBeRestored) => handleDeletedRecords(recordsToBeRestored));
  }

  void getDeletedRecordsWithId(Function handleDeletedRecords,
      int currentSessionId, Function callBack) async {
    Isar db = Get.find();
    db.recordCollections
        .where()
        .deletedAtIsNotNull()
        .filter()
        .sessionIdEqualTo(currentSessionId)
        .sortByCreatedAtDesc()
        .findAll()
        .then((deletedRecords) {
      handleDeletedRecords(deletedRecords);
      callBack();
    });
  }

  void getSessions(Function handleNewSession, Isar db) async {
    db.sessionCollections
        .where()
        .sortByStartTimeDesc()
        .findAll()
        .then((newSession) => handleNewSession(newSession));
  }

  Future<int> writeSessionToDB(
      SessionCollection newSession, SettingsCollection newSettings) async {
    Isar db = Get.find();

    await db.writeTxn(((isar) async {
      await db.sessionCollections.put(newSession);
      await db.settingsCollections.put(newSettings);
    }));
    return newSession.id;
  }

  Future<SettingsCollection?> getCurrentSetting(int id) async {
    Isar db = Get.find();
    return await db.settingsCollections.get(id);
  }

  RecordCollection getRecord(SpeedRange speedRange, VehicleType vehicleType,
      int sessionId, String volunteerName) {
    return RecordCollection()
      ..createdAt = DateTime.now()
      ..deletedAt = null
      ..speedRange = speedRange
      ..vehicleType = vehicleType
      ..sessionId = sessionId
      ..volunteerName = volunteerName;
  }

  void writeRecordToDB(SpeedRange speedRange, VehicleType vehicleType,
      int sessionId, String volunteerName) async {
    Isar db = Get.find();
    await db.writeTxn(((isar) async {
      await db.recordCollections
          .put(getRecord(speedRange, vehicleType, sessionId, volunteerName));
    }));
  }

  void deleteLatestRecord(RecordCollection latestRecord) async {
    Isar db = Get.find();
    await db.writeTxn(((isar) async {
      latestRecord.deletedAt = DateTime.now();
      await db.recordCollections.put(latestRecord);
    }));
  }

  void restoreLatestDeletedRecord(RecordCollection deletedRecord) async {
    Isar db = Get.find();
    await db.writeTxn(((isar) async {
      deletedRecord.deletedAt = null;
      await db.recordCollections.put(deletedRecord);
    }));
  }

  Future<List<String>> getCurrentSettingValue(int id) async {
    Isar db = Get.find();
    SettingsCollection? currentSettings = await db.settingsCollections.get(id);
    List<String> output = [];
    if (currentSettings != null) {
      output = currentSettings.value;
    }
    return output;
  }
}
