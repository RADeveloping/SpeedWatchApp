import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
                                  await ShowExportAllShareSheet(positioned);
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
                                  await ShowSingleExportShareSheet(positioned);
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

  Future<void> ShowExportAllShareSheet(TapDownDetails positioned) async {
    sidebarController.selectedSessions.value
        .addAll(sidebarController.sessions.value.toList());
    sidebarController.selectedSessions.refresh();
    final result = await Share.shareWithResult(
      'check out my website https://example.com',
      sharePositionOrigin: Rect.fromLTWH(
          positioned.globalPosition.dx, positioned.globalPosition.dy, 1, 1),
    );

    if (result.status == ShareResultStatus.dismissed) {
      sidebarController.isEditMode.value = false;
    } else if (result.status == ShareResultStatus.success) {
      // TODO MOVE TO ARCHIVE!!!
      Get.showSnackbar(GetSnackBar(
        message:
            'SUCCESSFULLY EXPORTED. THIS WILL BE REMOVED. WE NEED TO MOVE THE EXPORTED SESSIONS TO EXPORTED SECTION NOW.... ASK USER IF MOVE TO EXPORTED OR NOT ? ',
        duration: Duration(seconds: 3),
      ));
      // sidebarController.sessions.value.clear();
      // sidebarController.sessions.refresh();
      sidebarController.isEditMode.value = false;
    }
  }

  Future<void> ShowSingleExportShareSheet(TapDownDetails positioned) async {

    final directory =  await ExportService().exportSessionToExcel(sidebarController.selectedSessions[0]);

    final result = await Share.shareFilesWithResult([directory], subject: 'Excel File', sharePositionOrigin: Rect.fromLTWH(
        positioned.globalPosition.dx, positioned.globalPosition.dy, 1, 1),);

    if (result.status == ShareResultStatus.dismissed) {
      sidebarController.isEditMode.value = false;
    } else if (result.status == ShareResultStatus.success) {
      // TODO MOVE TO ARCHIVE!!!
      Get.showSnackbar(GetSnackBar(
        message:
            'SUCCESSFULLY EXPORTED. THIS WILL BE REMOVED. WE NEED TO MOVE THE EXPORTED SESSIONS TO EXPORTED SECTION NOW.... ASK USER IF MOVE TO EXPORTED OR NOT ? ',
        duration: Duration(seconds: 3),
      ));

      // sidebarController.sessions.value.removeWhere(
      //     (element) => sidebarController.selectedSessions.contains(element));
      // sidebarController.sessions.refresh();
      sidebarController.isEditMode.value = false;
    }
  }
}
