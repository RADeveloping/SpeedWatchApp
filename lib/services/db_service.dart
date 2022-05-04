import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../collections/session.dart';

class DbService extends GetxService {
  Future<Isar> init() async {
    final dir = await getApplicationSupportDirectory();
    final Isar isar = await Isar.open(
      schemas: [SessionSchema],
      directory: dir.path,
      inspector: true,
    );
    return isar;
  }
}