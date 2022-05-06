import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageScaffoldCustom extends StatelessWidget {
  final Widget child;
  final Widget? leading;
  final String largeTitle;
  String? previousPageTitle;
  final Widget? trailing;
  final Color backgroundColor;
  final int heroTag;

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
    return NestedScrollView(
        body: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false, child: child),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
        });
  }
}
