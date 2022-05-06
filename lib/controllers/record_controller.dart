import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:speedwatch/collections/record_collection.dart';
import 'package:speedwatch/enums/speed_range.dart';
import 'package:speedwatch/enums/vehicle_type.dart';

class RecordController extends GetxController {
  RecordCollection getRecord(SpeedRange speedRange, VehicleType vehicleType) {
    return RecordCollection()
        ..createdAt = DateTime.now()
        ..speedRange = speedRange
        ..vehicleType = vehicleType;
  }
}