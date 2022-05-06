import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  RxString title = 'Title'.obs;

  Rx<TextEditingController> textController =
      TextEditingController(text: '').obs;

  RxBool archiveExpanded = false.obs;
  RxBool isEditMode = false.obs;
}
