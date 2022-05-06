import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import 'cupertino_page_scaffold_custom.dart';

class Sidebar extends GetView<SidebarController> {
  final Widget child;
  final String largeTitle;
  final Widget? leading;
  Rx<TapPosition> position =
      TapPosition(Offset(0.0, 0.0), Offset(0.0, 0.0)).obs;

  Sidebar({required this.child, required this.largeTitle, this.leading});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffoldCustom(
      leading: leading,
      backgroundColor: kColourSidebarBackground,
      largeTitle: largeTitle,
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: PositionedTapDetector2(
          child: Icon(
            CupertinoIcons.share_up,
            color: kColourLight,
          ),
          onTap: (positioned) {
            // controller.isEditMode.value = !controller.isEditMode.value;
            Share.share(
              'LOG NAME WOULD GO HERE',
              sharePositionOrigin: Rect.fromLTWH(
                  positioned.global.dx, positioned.global.dy, 0.5, 20),
            );
          },
        ),
        onPressed: () {},
      ),
      heroTag: 0,
      child: child,
    );
  }
}
