import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/home_controller.dart';

import '../constants.dart';
import 'springboard.dart';

class SessionDetail extends GetView<SessionDetail> {
  @override
  Widget build(BuildContext context) {
    print(Get.parameters['sessionID']);

    return Container(
        padding: EdgeInsets.all(20.0),
        color: kColourRightPaneBackground,
        child: SpringBoard(
          onPressed: (sectionIndex, vehicleType) {
            print('${sectionIndex}, ${vehicleType}');
          },
        ));
  }
}
