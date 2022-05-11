import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import '../services/export_service.dart';

class NavigationBarCustom extends GetView<SidebarController> {
  final Widget child;

  NavigationBarCustom({required this.child});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        body:
            CupertinoPageScaffold(resizeToAvoidBottomInset: true, child: child),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
                previousPageTitle: Get.previousRoute.length > 0
                    ? Get.previousRoute.split('/')[1]
                    : '',
                heroTag: 0,
                brightness: Brightness.dark,
                backgroundColor: kColourRightPaneBackground,
                largeTitle: Obx(() => Text(
                      controller.isEditMode.value &&
                              controller.selectedSessions.isNotEmpty
                          ? '${controller.selectedSessions.length} Selected'
                          : Get.currentRoute.split('/')[1],
                      style: TextStyle(color: Colors.white),
                    )),
                trailing: (Get.currentRoute
                            .isCaseInsensitiveContains('create') ||
                        Get.currentRoute.isCaseInsensitiveContains('edit'))
                    ? Container()
                    : Get.currentRoute.isCaseInsensitiveContains('sessions')
                        ? Obx(() => controller.sessions.length > 0
                            ? CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: controller.isEditMode.value
                                    ? Text(
                                        'Done',
                                        style: TextStyle(color: kColourLight),
                                      )
                                    : Text(
                                        'Select',
                                        style: TextStyle(color: kColourLight),
                                      ),
                                onPressed: () {
                                  if (controller.isEditMode.value) {
                                    controller.isEditMode.value = false;
                                  } else {
                                    controller.isEditMode.value = true;
                                    controller.selectedSessions().clear();
                                  }
                                },
                              )
                            : Text(''))
                        : GestureDetector(
                            onTapDown: (positioned) async {
                              await ShowExportShareSheet(positioned, context);
                            },
                            child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                CupertinoIcons.share_up,
                                color: kColourLight,
                              ),
                              onPressed: () {},
                            ),
                          )),
          ];
        });
  }

  Future<void> ShowExportShareSheet(
      TapDownDetails positioned, BuildContext context) async {
    List<String> directories = [
      await ExportService()
          .exportSessionToExcel(controller.currentSession.value)
    ];

    final result = await Share.shareFilesWithResult(
      directories,
      subject: 'Export to Excel',
      sharePositionOrigin: Rect.fromLTWH(
          positioned.globalPosition.dx, positioned.globalPosition.dy, 1, 1),
    );

    if (result.status == ShareResultStatus.dismissed) {
    } else if (result.status == ShareResultStatus.success) {
      if (!controller.currentSession.value.hasExportedSession) {
        ShowConfirmMoveDialog(context);
      }
    }
  }

  void ShowConfirmMoveDialog(BuildContext context) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.dark),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              child: CupertinoAlertDialog(
                  title: const Text('Move Session to "Archived"'),
                  actions: <CupertinoDialogAction>[
                    CupertinoDialogAction(
                        child: const Text(
                          'Don\'t Move',
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    CupertinoDialogAction(
                        child: const Text(
                          'Move',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          DbService dbService = Get.find();
                          dbService.setHasSingleExportedSession(
                              controller.currentSession.value);
                          Navigator.pop(context);
                        })
                  ]),
            )));
  }
}
