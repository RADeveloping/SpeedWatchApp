import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import '../services/export_service.dart';
import 'cupertino_page_scaffold_custom.dart';

class Sidebar extends GetView<SidebarController> {
  final Widget child;
  final String largeTitle;
  final Widget? leading;
  final String? previousPageTitle;

  Sidebar(
      {required this.child,
      required this.largeTitle,
      this.leading,
      this.previousPageTitle});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffoldCustom(
      leading: leading,
      backgroundColor: kColourSidebarBackground,
      largeTitle: largeTitle,
      previousPageTitle: previousPageTitle,
      trailing: largeTitle == 'Log'
          ? GestureDetector(
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
            )
          : Obx(() => CupertinoButton(
                padding: EdgeInsets.zero,
                child: controller.isEditMode.value
                    ? Text(
                        'Done',
                        style: TextStyle(color: kColourLight),
                      )
                    : Icon(
                        CupertinoIcons.ellipsis_circle,
                        color: kColourLight,
                      ),
                onPressed: () {
                  if (controller.isEditMode.value) {
                    controller.isEditMode.value = false;
                  } else {
                    controller.isEditMode.value = true;
                    controller.selectedSessions().clear();
                  }
                },
              )),
      heroTag: 0,
      child: child,
    );
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
                  title: const Text('Move Sessions to "Exported Sessions"'),
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
