import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../components/rightpane.dart';
import '../components/sidebar.dart';

class HomeController extends GetxController {
  RxString title = 'Home'.obs;
  RxList<Widget> masterDetailList = <Widget>[
    Sidebar(),
    RightPane(),
  ].obs;
}
