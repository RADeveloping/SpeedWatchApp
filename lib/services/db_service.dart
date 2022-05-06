import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/collections/record_collection.dart';

import '../collections/session_collection.dart';
import '../collections/settings_collection.dart';

class DbService extends GetxService {
  Future<Isar> init() async {
    final dir = await getApplicationSupportDirectory();
    final Isar isar = await Isar.open(
      schemas: [SessionCollectionSchema, SettingsCollectionSchema, RecordCollectionSchema],
      directory: dir.path,
      inspector: true,
    );
    return isar;
  }
}