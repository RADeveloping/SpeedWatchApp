import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import '../collections/session_collection.dart';
import '../services/export_service.dart';

class NavigationBarCustom extends GetView<SidebarController> {
  final Widget child;
  final SidebarController sidebarController = Get.find();

  NavigationBarCustom({required this.child});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        body:
            CupertinoPageScaffold(resizeToAvoidBottomInset: true, child: child),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(() => CupertinoSliverNavigationBar(
                previousPageTitle: Get.previousRoute.length > 0
                    ? Get.previousRoute.split('/')[1]
                    : '',
                heroTag: 0,
                leading: controller.isEditMode.value &&
                        Get.currentRoute.isCaseInsensitiveContains('sessions')
                    ? Obx(() => CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Text(
                            controller.selectedSessions.length ==
                                    controller.sessions.length
                                ? 'Deselect All'
                                : 'Select All',
                          ),
                          onPressed: () {
                            if (controller.selectedSessions.firstWhereOrNull(
                                    (element) =>
                                        element.hasExportedSession == false) !=
                                null) {
                              controller.selectedSessions.removeWhere(
                                  (session) =>
                                      session.hasExportedSession == false);
                              controller.selectedSessions.refresh();
                            } else {
                              controller.selectedSessions.addAll(controller
                                  .sessions
                                  .where((session) =>
                                      session.hasExportedSession == false)
                                  .toList());
                              controller.selectedSessions.refresh();
                            }
                          },
                        ))
                    : null,
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
                          ))),
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

  Container HandleSelect(BuildContext context) {
    if (sidebarController.isEditMode.value == true) {
      if (sidebarController.sessions.firstWhereOrNull(
              (element) => element.hasExportedSession == false) ==
          null) {
        // Has No New Session
        return Container(
          height: 50,
          color: Colors.transparent,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: sidebarController.selectedSessions.isEmpty
                      ? Container()
                      : GestureDetector(
                          onTapDown: (positioned) async {
                            await ShowSelectedExportShareSheet(
                                positioned, context);
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
          color: Colors.transparent,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: sidebarController.selectedSessions.isEmpty
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

  Future<void> ShowSelectedExportShareSheet(
      TapDownDetails positioned, BuildContext context) async {
    List<String> directories = await ExportService()
        .exportSessionsToExcel(sidebarController.selectedSessions);

    final result = await Share.shareFilesWithResult(
      directories,
      subject: 'Export to Excel',
      sharePositionOrigin: Rect.fromLTWH(
          positioned.globalPosition.dx, positioned.globalPosition.dy, 1, 1),
    );

    if (result.status == ShareResultStatus.dismissed) {
      sidebarController.isEditMode.value = false;
    } else if (result.status == ShareResultStatus.success) {
      if (isMoveNeeded(sidebarController.selectedSessions.value)) {
        showMoveExportedAlertDialog(context);
      }
      sidebarController.isEditMode.value = false;
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
              color: Colors.black.withOpacity(0.6),
              child: CupertinoAlertDialog(
                  title: Text(
                      'Move Session${sidebarController.selectedSessions.value.length > 1 ? 's' : ''} to "Archived"'),
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
                              sidebarController.selectedSessions);
                          Navigator.pop(context);
                        })
                  ]),
            )));
  }
}
