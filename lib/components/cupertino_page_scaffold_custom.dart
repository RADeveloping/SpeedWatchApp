import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CupertinoPageScaffoldCustom extends StatelessWidget {
  final Widget child;
  final Widget? leading;
  final String largeTitle;
  final Widget? trailing;

  CupertinoPageScaffoldCustom(
      {required this.child,
      this.leading,
      required this.largeTitle,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        body: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false, child: child),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
                leading: leading,
                brightness: Brightness.dark,
                backgroundColor: kColourRightPaneBackground,
                trailing: trailing,
                largeTitle: Text(
                  largeTitle,
                  style: TextStyle(color: Colors.white),
                ))
          ];
        });
  }
}
