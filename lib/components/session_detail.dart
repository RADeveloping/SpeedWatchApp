import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:speedwatch/services/db_service.dart';

import 'package:speedwatch/constants.dart';
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
        middle: SwitchUser(controller: s, sliding: _sliding),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              // Undo
              onPressed: () {},
              child: GestureDetector(
                child: Obx(() => Icon(
                      CupertinoIcons.arrow_uturn_left_circle,
                      color: s.records.length > 0
                          ? kColourLight
                          : kColourDisabledButton,
                    )),
                onTap: () {
                  DbService dbService = Get.find();
                  List<RecordCollection> records = s.records.value;
                  records.length == 0
                      ? null
                      : dbService.deleteLatestRecord(records[0]);
                },
              ),
              padding: EdgeInsets.zero,
            ),
            CupertinoButton(
                // Redo
                onPressed: () {},
                child: GestureDetector(
                  child: Obx(() => Icon(
                        CupertinoIcons.arrow_uturn_right_circle,
                        color: s.deletedRecords.length > 0
                            ? kColourLight
                            : kColourDisabledButton,
                      )),
                  onTap: () {
                    DbService dbService = Get.find();
                    List<RecordCollection> deletedRecords =
                        s.deletedRecords.value;
                    deletedRecords.length == 0
                        ? null
                        : dbService
                            .restoreLatestDeletedRecord(deletedRecords[0]);
                  },
                ),
                padding: EdgeInsets.zero),
          ],
        ),
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
                String currentSessionIDInString =
                    await Get.parameters['sessionID'] as String;
                int currentSessionId = int.parse(currentSessionIDInString);
                dbService.writeRecordToDB(
                    speedRange,
                    vehicleType,
                    currentSessionId,
                    s.currentSession.value.volunteerNames[_sliding.value]);
              },
            )),
      ),
    );
  }
}

class SwitchUser extends StatelessWidget {
  RxInt sliding;

  SwitchUser({
    Key? key,
    required this.controller,
    required this.sliding,
  }) : super(key: key);

  final SidebarController controller;

  @override
  Widget build(BuildContext context) {
    return controller.currentSession.value.volunteerNames.length > 1
        ? GestureDetector(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => Text(
                    controller
                        .currentSession.value.volunteerNames[sliding.value],
                    style: TextStyle(color: Colors.white))),
                Container(
                  width: 5,
                ),
                Icon(
                  CupertinoIcons.arrow_swap,
                )
              ],
            ),
            onTap: () {
              showPopover(
                context: context,
                transitionDuration: const Duration(milliseconds: 150),
                bodyBuilder: (context) => CupertinoPicker(
                  onSelectedItemChanged: (int value) {
                    sliding.value = value;
                  },
                  scrollController:
                      FixedExtentScrollController(initialItem: sliding.value),
                  itemExtent: 36.0,
                  squeeze: 1,
                  children: controller.currentSession.value.volunteerNames
                      .map((name) => Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ))
                      .toList(),
                ),
                direction: PopoverDirection.top,
                barrierColor: Colors.black.withOpacity(0.8),
                backgroundColor: kColourRightPaneBackground,
                width: 400,
                height: 200,
                arrowHeight: 15,
                arrowWidth: 30,
              );
            },
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => Text(
                  controller.currentSession.value.volunteerNames[sliding.value],
                  style: TextStyle(color: Colors.white))),
            ],
          );
  }
}
