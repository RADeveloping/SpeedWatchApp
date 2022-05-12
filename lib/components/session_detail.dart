import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/services/db_service.dart';

import '../collections/record_collection.dart';
import '../controllers/sidebar_controller.dart';
import 'springboard.dart';

class SessionDetailDetailController extends GetxController {
  RxInt sliding = 0.obs;
}

class SessionDetail extends GetView<SessionDetailDetailController> {
  @override
  Widget build(BuildContext context) {
    SidebarController s = Get.find();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {
            Get.toNamed(
              '/Logs/${s.currentSession.value.id.toString()}/Edit',
              arguments: s.currentSession.value,
              preventDuplicates: true,
            );
          },
          child: Text('Edit'),
          padding: EdgeInsets.zero,
        ),
        middle: SwitchUser(),
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
            child: Center(
              child: Obx(() => !s.isSessionCompleted.value
                  ? SpringBoard(
                      onPressed: (speedRange, vehicleType) async {
                        if (DateTime.now()
                            .isBefore(s.currentSession.value.endTime)) {
                          DbService dbService = Get.find();
                          int currentSessionId = s.currentSession.value.id;
                          dbService.writeRecordToDB(
                              speedRange,
                              vehicleType,
                              currentSessionId,
                              s.currentSession.value
                                  .volunteerNames[controller.sliding.value]);
                          s.deletedRecords.forEach((record) {
                            dbService.clearDeletedRecord(record);
                          });
                        } else {
                          s.isSessionCompleted.value = true;
                        }
                      },
                    )
                  : Center(
                      child: Text(
                        'Session Ended',
                        style: TextStyle(
                            color: kColourPlaceHolderText,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
            )),
      ),
    );
  }
}

class SwitchUser extends GetView<SessionDetailDetailController> {
  final SidebarController sidebarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => sidebarController.currentSession.value.volunteerNames.length > 1
        ? GestureDetector(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => Text(
                    sidebarController.currentSession.value
                        .volunteerNames[controller.sliding.value],
                    style: TextStyle(color: kColourLight))),
                Container(
                  width: 5,
                ),
                Text(
                  '▾',
                  style: TextStyle(fontSize: 20, color: kColourLight),
                )
              ],
            ),
            onTap: () {
              showPopover(
                context: context,
                transitionDuration: const Duration(milliseconds: 150),
                bodyBuilder: (context) => CupertinoPicker(
                  onSelectedItemChanged: (int value) {
                    controller.sliding.value = value;
                  },
                  scrollController: FixedExtentScrollController(
                      initialItem: controller.sliding.value),
                  itemExtent: 36.0,
                  squeeze: 1,
                  children:
                      sidebarController.currentSession.value.volunteerNames
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
                  sidebarController.currentSession.value
                      .volunteerNames[controller.sliding.value],
                  style: TextStyle(color: Colors.white))),
            ],
          ));
  }
}
