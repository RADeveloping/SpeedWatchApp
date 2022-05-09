import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

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
                await ShowShareSheet(positioned, context);
              },
              child: CupertinoButton(
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

  Future<void> ShowShareSheet(
      TapDownDetails positioned, BuildContext context) async {
    Get.showOverlay(
        asyncFunction: () async {
          controller.selectedSessions.value
              .addAll(controller.sessions.value.toList());
          controller.selectedSessions.refresh();
          final result = await Share.shareWithResult(
            'check out my website https://example.com',
            sharePositionOrigin: Rect.fromLTWH(positioned.globalPosition.dx,
                positioned.globalPosition.dy + 20, 1, 1),
          );

          if (result.status == ShareResultStatus.dismissed) {
            controller.isEditMode.value = false;
          } else if (result.status == ShareResultStatus.success) {
            ShowConfirmMoveDialog(context);

            controller.isEditMode.value = false;
          }
        },
        loadingWidget: Text('LOADING'));
  }

  void ShowConfirmMoveDialog(BuildContext context) {
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
                          controller.sessions.value.clear();
                          controller.sessions.refresh();
                          Navigator.pop(context);
                        })
                  ]),
            )));
  }
}
