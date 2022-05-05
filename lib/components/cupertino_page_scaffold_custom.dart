import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageScaffoldCustom extends StatelessWidget {
  final Widget child;
  final Widget? leading;
  final String largeTitle;
  final Widget? trailing;
  final Color backgroundColor;

  CupertinoPageScaffoldCustom(
      {required this.child,
      this.leading,
      required this.largeTitle,
      this.trailing,
      required this.backgroundColor});

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
                backgroundColor: backgroundColor,
                trailing: trailing,
                largeTitle: Text(
                  largeTitle,
                  style: TextStyle(color: Colors.white),
                ))
          ];
        });
  }
}
