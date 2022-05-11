import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import '../collections/session_collection.dart';
import '../services/db_service.dart';
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
                  resizeToAvoidBottomInset: true, child: child),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  CupertinoSliverNavigationBar(
                    heroTag: heroTag,
                    leading: leading,
                    brightness: Brightness.dark,
                    backgroundColor: backgroundColor,
                    previousPageTitle: previousPageTitle,
                    largeTitle: Obx(() => Text(
                          sidebarController.isEditMode.value &&
                                  sidebarController.selectedSessions.isNotEmpty
                              ? '${sidebarController.selectedSessions.length} Selected'
                              : largeTitle,
                          style: TextStyle(color: Colors.white),
                        )),
                    trailing: trailing,
                  )
                ];
              }),
        ),
        Obx(() => HandleSelect(context))
      ],
    );
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
