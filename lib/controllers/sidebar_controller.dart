import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../collections/session_collection.dart';

class SidebarController extends GetxController {
  RxString title = 'Title'.obs;

  Rx<TextEditingController> textController =
      TextEditingController(text: '').obs;

  RxBool archiveExpanded = false.obs;
  RxBool isEditMode = false.obs;
  RxList<SessionCollection> selectedSessions = <SessionCollection>[].obs;

  void selectAll() {}

  final sessions = <SessionCollection>[].obs;

  void handleNewSessions(List<SessionCollection> newSessions) {
    sessions.value = newSessions;
  }
}
