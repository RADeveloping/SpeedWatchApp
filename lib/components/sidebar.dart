import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
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
      trailing: Obx(() => CupertinoButton(
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
}
