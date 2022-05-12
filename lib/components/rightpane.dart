import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class RightPane extends GetView<RightPane> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        color: kColourRightPaneBackground,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('lib/assets/images/logo_large.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Kerrisdale Oakridge Marpole Community Policing Centre Speed Watch',
                    style: kTextStyleWelcomeMessage,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Create a session or tap an existing session on the left sidebar to begin.',
                    style: kTextStylePlaceHelpPlaceholder,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Center(
                  child: CupertinoTheme(
                child: CupertinoButton.filled(
                  onPressed: () {
                    Get.toNamed('/Sessions/Create',
                        parameters: null, preventDuplicates: false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.calendar_badge_plus,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'New Session',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                data: CupertinoThemeData(
                    brightness: Brightness.dark, primaryColor: kColourLight),
              )),
            ],
          ),
        ));
  }
}
