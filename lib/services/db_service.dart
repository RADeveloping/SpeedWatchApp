import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../collections/session_collection.dart';
import '../collections/settings_collection.dart';
import '../controllers/sidebar_controller.dart';

class DbService extends GetxService {
  Future<Isar> init() async {
    final dir = await getApplicationSupportDirectory();
    final Isar isar = await Isar.open(
      schemas: [SessionCollectionSchema, SettingsCollectionSchema],
      directory: dir.path,
      inspector: true,
    ).then((db) {
      SidebarController s = Get.find();
      s.getSessions(db);
      s.setSessionsListener(db);
      return db;
    });
    return isar;
  }
}