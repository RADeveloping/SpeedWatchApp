import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../constants.dart';

class RightPane extends GetView<RightPane> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kColourRightPaneBackground,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('lib/assets/images/logo_large.png'),
                    Text(
                      'Kerrisdale Oakridge Marpole Community Policing Centre Speed Watch',
                      style: kTextStyleWelcomeMessage,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Create a session or tap an existing session on the left sidebar to begin.',
                      style: kTextStylePlaceHelpPlaceholder,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: UnconstrainedBox(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: FaIcon(CupertinoIcons.calendar_badge_plus),
                    label: Text(
                      'New Session',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kColourLight)),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
