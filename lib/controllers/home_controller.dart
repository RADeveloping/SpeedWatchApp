import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:speedwatch/components/rightpane.dart';
import 'package:speedwatch/components/sessions_list.dart';

import '../components/sidebar.dart';

class HomeController extends GetxController {
  RxString title = 'Home'.obs;
  RxList<Widget> children = <Widget>[
    Sidebar(
      child: SessionsList(),
      largeTitle: 'Sessions',
    ),
    RightPane()
  ].obs;
}
