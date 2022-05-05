import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../collections/session_collection.dart';


class SidebarController extends GetxController {
  RxString title = 'Title'.obs;
  Rx<TextEditingController> textController =
      TextEditingController(text: '').obs;

  RxBool archiveExpanded = false.obs;

  RxList<SessionCollection> sessions = <SessionCollection>[].obs;

  void setSessionsListener(Isar db) async {
    Stream<void> sessionsChanged = db.sessionCollections.watchLazy();
    sessionsChanged.listen((s) {
      getSessions(db);
    });
  }

  void getSessions(Isar db) async {
    db.sessionCollections.where().findAll().then((newSessions) {
      sessions = RxList<SessionCollection>(newSessions);
      sessions.refresh();
    });
  }
}
