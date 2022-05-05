import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import 'cupertino_page_scaffold_custom.dart';

class Sidebar extends GetView<SidebarController> {
  final Widget child;
  final String largeTitle;
  final Widget? leading;

  Sidebar({required this.child, required this.largeTitle, this.leading});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffoldCustom(
      leading: leading,
      backgroundColor: kColourSidebarBackground,
      largeTitle: largeTitle,
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(
          CupertinoIcons.share_up,
          color: kColourLight,
        ),
        onPressed: () {},
      ),
      heroTag: 0,
      child: child,
    );
  }
}
