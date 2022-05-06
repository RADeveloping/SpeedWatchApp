import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:speedwatch/collections/record_collection.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/record_controller.dart';

import '../constants.dart';
import 'springboard.dart';

class SessionDetail extends GetView<SessionDetail> {
  RecordController recordController = RecordController();
  @override
  Widget build(BuildContext context) {
    print(Get.parameters['sessionID']);

    return Container(
        padding: EdgeInsets.all(20.0),
        color: kColourRightPaneBackground,
        child: SpringBoard(
          onPressed: (speedRange, vehicleType) async {
            Isar db = Get.find();
            await db.writeTxn(((isar) async {
              await db.recordCollections.put(recordController.getRecord(speedRange, vehicleType));
            }));
          },
        ));
  }
}
