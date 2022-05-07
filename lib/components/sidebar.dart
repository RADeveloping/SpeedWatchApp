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
      trailing: Obx(() => CupertinoButton(
            padding: EdgeInsets.zero,
            child: controller.isEditMode.value
                ? GestureDetector(
                    child: Text(
                      'Done',
                      style: TextStyle(color: kColourLight),
                    ),
                    onTap: () {
                      controller.isEditMode.value = false;
                    },
                  )
                : GestureDetector(
                    child: Icon(
                      CupertinoIcons.ellipsis_circle,
                      color: kColourLight,
                    ),
                    onTapDown: (tapDetails) {
                      controller.isEditMode.value = true;
                      controller.selectedSessions().clear();
                    },
                  ),
            onPressed: () {},
          )),
      heroTag: 0,
      child: child,
    );
  }
}
