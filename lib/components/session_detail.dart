import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/home_controller.dart';

import '../constants.dart';
import 'springboard.dart';

class SessionDetail extends GetView<SessionDetail> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Container(
        padding: EdgeInsets.all(20.0),
        color: kColourRightPaneBackground,
        child: SpringBoard());
  }
}
