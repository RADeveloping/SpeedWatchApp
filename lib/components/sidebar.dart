import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import '../collections/session_collection.dart';
import '../services/export_service.dart';
import 'navigation_bar.dart';

class Sidebar extends StatelessWidget {
  final Widget child;
  final SidebarController controller = Get.find();
  final String largeTitle;

  Sidebar({required this.child, required this.largeTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NavigationBarCustom(
            child: child,
            largeTitle: largeTitle,
          ),
        ),
        Obx(() => HandleSelect(context))
      ],
    );
  }

  Container HandleSelect(BuildContext context) {
    if (controller.isEditMode.value == true) {
      if (controller.sessions.firstWhereOrNull(
              (element) => element.hasExportedSession == false) ==
          null) {
        // Has No New Session
        return Container(
          height: 50,
          color: kColourSidebarBackground,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: controller.selectedSessions.isEmpty
                      ? Text(
                          'Export',
                          style: TextStyle(color: kColourDisabledButton),
                        )
                      : GestureDetector(
                          onTapDown: (positioned) {
                            ShowSelectedExportShareSheet(positioned, context);
                          },
                          child: Text(
                            'Export',
                            style: TextStyle(color: kColourLight),
                          ),
                        ))),
        );
      } else {
        // Has New Session
        return Container(
          height: 50,
          color: kColourSidebarBackground,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: controller.selectedSessions.isEmpty
                      ? Text(
                          'Export',
                          style: TextStyle(color: kColourDisabledButton),
                        )
                      : GestureDetector(
                          onTapDown: (positioned) {
                            ShowSelectedExportShareSheet(positioned, context);
                          },
                          child: Text(
                            'Export',
                            style: TextStyle(color: kColourLight),
                          ),
                        ))),
        );
      }
    } else {
      return Container();
    }
  }

  String getFilename(List<String> directories) {
    if (directories.length > 1) {
      return (directories.length.toString() + ' Documents');
    } else if (directories.length == 1) {
      return (directories[0].split('/').last);
    }
    return '';
  }

  Future<void> ShowSelectedExportShareSheet(
      TapDownDetails positioned, BuildContext context) async {
    if (controller.isShareSheetOpening == true) {
      return;
    }
    controller.isShareSheetOpening = true;
    List<String> directories = await ExportService()
        .exportSessionsToExcel(controller.selectedSessions);
    final result = await Share.shareFilesWithResult(
      directories,
      subject: getFilename(directories),
      sharePositionOrigin: Rect.fromLTWH(
          positioned.globalPosition.dx, positioned.globalPosition.dy, 1, 1),
    );

    if (result.status == ShareResultStatus.dismissed) {
      controller.isEditMode.value = false;
      controller.isShareSheetOpening = false;
    } else if (result.status == ShareResultStatus.success) {
      if (isMoveNeeded(controller.selectedSessions.value)) {
        showMoveExportedAlertDialog(context);
      }
      controller.isShareSheetOpening = false;
      controller.isEditMode.value = false;
    }
  }

  bool isMoveNeeded(List<SessionCollection> sessions) {
    for (var session in sessions) {
      if (!session.hasExportedSession) {
        return true;
      }
    }
    return false;
  }

  void showMoveExportedAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.dark),
            child: Container(
              color: Colors.black.withValues(alpha: 0.6),
              child: CupertinoAlertDialog(
                  title: Text(
                      'Move Session${controller.selectedSessions.value.length > 1 ? 's' : ''} to "Archived"'),
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
                          dbService.setHasMultipleExportedSession(
                              controller.selectedSessions);
                          Navigator.pop(context);
                        })
                  ]),
            )));
  }
}
