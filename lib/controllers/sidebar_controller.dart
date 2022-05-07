import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../collections/record_collection.dart';
import '../collections/session_collection.dart';


class SidebarController extends GetxController {
  RxString title = 'Title'.obs;

  Rx<TextEditingController> textController =
      TextEditingController(text: '').obs;

  RxBool archiveExpanded = false.obs;
  RxBool isEditMode = false.obs;

  final sessions = <SessionCollection>[].obs;
  final records = <RecordCollection>[].obs;

  final currentSession = SessionCollection().obs;

  void handleNewSessions(List<SessionCollection> newSessions) {
    sessions.value = newSessions;
  }

  void handleNewRecords(List<RecordCollection> newRecords) async {
    records.value = newRecords;
    print(records);
  }
}
