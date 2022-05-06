import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/collections/record_collection.dart';

import '../collections/session_collection.dart';
import '../collections/settings_collection.dart';
import '../controllers/sidebar_controller.dart';

class DbService extends GetxService {

  Future<DbService> init() async {
    final dir = await getApplicationSupportDirectory();
    final Isar isar = await Isar.open(
      schemas: [SessionCollectionSchema, SettingsCollectionSchema, RecordCollectionSchema],
      directory: dir.path,
      inspector: true,
    ).then((db) {
      SidebarController s = Get.find();
      getSessions(s.handleNewSessions, db);
      setSessionsListener(s.handleNewSessions, db);
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

  void getSessions(Function handleNewSession, Isar db) async {
    db.sessionCollections.where().sortByStartTimeDesc().findAll().then((newSession) => handleNewSession(newSession));
  }

  Future<int> writeSessionToDB(SessionCollection newSession, SettingsCollection newSettings) async {
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