import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/services/db_service.dart';

import '../constants.dart';
import '../controllers/sidebar_controller.dart';
import 'springboard.dart';

class SessionDetail extends GetView<SessionDetail> {
  RxInt _sliding = 0.obs;

  @override
  Widget build(BuildContext context) {
    SidebarController s = Get.find();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {},
          child: Text('Edit'),
          padding: EdgeInsets.zero,
        ),
        middle: s.currentSession.value.volunteerNames.length > 1 ? Obx(() => CupertinoSlidingSegmentedControl(
                children: s.currentSession.value.volunteerNames.map((name) => Text(name, style: TextStyle(color: Colors.white))).toList().asMap(),
                groupValue: _sliding.value,
                thumbColor: kColourLight,
                onValueChanged: (newValue) {
                  _sliding.value = newValue as int;
                })) : Text(s.currentSession.value.volunteerNames[0], style: TextStyle(color: Colors.white)),
        trailing: CupertinoButton(
            onPressed: () {}, child: Text('Undo'), padding: EdgeInsets.zero),
        backgroundColor: kColourRightPaneBackground,
        brightness: Brightness.dark,
      ),
      backgroundColor: kColourRightPaneBackground,
      child: SafeArea(
        child: Container(
            padding: EdgeInsets.all(20.0),
            color: kColourRightPaneBackground,
            child: SpringBoard(
              onPressed: (speedRange, vehicleType) async {
                DbService dbService = Get.find();
                String currentSessionIDInString = await Get.parameters['sessionID'] as String;
                int currentSessionId = int.parse(currentSessionIDInString);
                dbService.writeRecordToDB(speedRange, vehicleType, currentSessionId);
              },
            )),
      ),
    );
  }


}
