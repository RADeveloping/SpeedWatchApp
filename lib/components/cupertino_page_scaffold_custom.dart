import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import '../services/export_service.dart';

class CupertinoPageScaffoldCustom extends StatelessWidget {
  final Widget child;
  final Widget? leading;
  final String largeTitle;
  String? previousPageTitle;
  final Widget? trailing;
  final Color backgroundColor;
  final int heroTag;

  final SidebarController sidebarController = Get.find();

  CupertinoPageScaffoldCustom(
      {required this.child,
      this.leading,
      required this.largeTitle,
      this.previousPageTitle,
      this.trailing,
      required this.backgroundColor,
      required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NestedScrollView(
              body: CupertinoPageScaffold(
                  resizeToAvoidBottomInset: false, child: child),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  CupertinoSliverNavigationBar(
                      heroTag: heroTag,
                      leading: leading,
                      brightness: Brightness.dark,
                      backgroundColor: backgroundColor,
                      previousPageTitle: previousPageTitle,
                      trailing: trailing,
                      largeTitle: Text(
                        largeTitle,
                        style: TextStyle(color: Colors.white),
                      ))
                ];
              }),
        ),
        Obx(() => sidebarController.isEditMode.value
            ? Container(
                height: 50,
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: sidebarController.selectedSessions.isEmpty
                          ? GestureDetector(
                              onTapDown: (positioned) async {
                                Get.showOverlay(asyncFunction: () async {
                                  await ShowExportAllShareSheet(
                                      positioned, context);
                                });
                              },
                              child: Text(
                                'Export All',
                                style: TextStyle(color: kColourLight),
                              ),
                            )
                          : GestureDetector(
                              onTapDown: (positioned) async {
                                Get.showOverlay(asyncFunction: () async {
                                  await ShowSelectedExportShareSheet(
                                      positioned, context);
                                });
                              },
                              child: Text(
                                'Export ${sidebarController.selectedSessions.length} items',
                                style: TextStyle(color: kColourLight),
                              ),
                            )),
                ),
              )
            : Container())
      ],
    );
  }

  Future<void> ShowExportAllShareSheet(
      TapDownDetails positioned, BuildContext context) async {
    sidebarController.selectedSessions.value
        .addAll(sidebarController.sessions.value.toList());
    sidebarController.selectedSessions.refresh();

    List<String> directories = await ExportService()
        .exportSessionsToExcel(sidebarController.selectedSessions);
    final result = await Share.shareFilesWithResult(
      directories,
      subject: 'Export to Excel',
      sharePositionOrigin: Rect.fromLTWH(positioned.globalPosition.dx,
          positioned.globalPosition.dy - 20, 1, 1),
    );

    if (result.status == ShareResultStatus.dismissed) {
      sidebarController.isEditMode.value = false;
    } else if (result.status == ShareResultStatus.success) {
      // TODO MOVE TO ARCHIVE!!!
      Get.showSnackbar(GetSnackBar(
        message:
            '${directories.length} session${directories.length == 1 ? '' : 's'} exported successfully',
        duration: Duration(seconds: 3),
      ));
      // sidebarController.sessions.value.clear();
      // sidebarController.sessions.refresh();
      showMoveExportedAlertDialog(context);
      sidebarController.isEditMode.value = false;
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
      // TODO MOVE TO ARCHIVE!!!
      Get.showSnackbar(GetSnackBar(
        message:
            '${directories.length} session${directories.length == 1 ? '' : 's'} exported successfully',
        duration: Duration(seconds: 3),
      ));

      showMoveExportedAlertDialog(context);

      // sidebarController.sessions.value.removeWhere(
      //     (element) => sidebarController.selectedSessions.contains(element));
      // sidebarController.sessions.refresh();
      sidebarController.isEditMode.value = false;
    }
  }

  void showMoveExportedAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.dark),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              child: CupertinoAlertDialog(
                  title: const Text('Move Sessions to "Exported sessions"'),
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
                          sidebarController.sessions.value.clear();
                          sidebarController.sessions.refresh();
                          Navigator.pop(context);
                        })
                  ]),
            )));
  }
}
