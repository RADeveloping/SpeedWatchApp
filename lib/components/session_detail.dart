import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/record_controller.dart';

import '../constants.dart';
import 'springboard.dart';

class SessionDetail extends GetView<SessionDetail> {
  RecordController recordController = RecordController();
  RxInt _sliding = 0.obs;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {},
          child: Text('Edit'),
          padding: EdgeInsets.zero,
        ),
        middle: Obx(() => CupertinoSlidingSegmentedControl(
                children: {
                  0: Text(
                    'Volunteer 0',
                    style: TextStyle(color: Colors.white),
                  ),
                  1: Text('Volunteer 1', style: TextStyle(color: Colors.white)),
                  2: Text('Volunteer 2', style: TextStyle(color: Colors.white)),
                },
                groupValue: _sliding.value,
                thumbColor: kColourLight,
                onValueChanged: (newValue) {
                  _sliding.value = newValue as int;
                })),
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
                String currentSessionIDInString = await Get.parameters['sessionID'] as String;
                int currentSessionId = int.parse(currentSessionIDInString);
                recordController.writeRecordToDB(speedRange, vehicleType, currentSessionId);
              },
            )),
      ),
    );
  }
}
