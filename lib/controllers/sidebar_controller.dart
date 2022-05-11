import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../collections/record_collection.dart';
import '../collections/session_collection.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';

class SidebarController extends GetxController {
  RxString title = 'Title'.obs;

  Rx<TextEditingController> textController =
      TextEditingController(text: '').obs;
  RxBool archiveExpanded = false.obs;
  RxBool isEditMode = false.obs;
  RxList<SessionCollection> selectedSessions = <SessionCollection>[].obs;
  RxList<SessionCollection> selectedSessionsArchived =
      <SessionCollection>[].obs;
  RxList<SessionCollection> selectedSessionsNonArchived =
      <SessionCollection>[].obs;

  RxBool isSearching = false.obs;
  final sessions = <SessionCollection>[].obs;
  final records = <RecordCollection>[].obs;

  final deletedRecords = <RecordCollection>[].obs;

  RxInt limitRecords = 20.obs;

  RxInt limitSessionsMain = 20.obs;
  RxInt limitSessionsArchived = 20.obs;

  RxBool isSessionCompleted = false.obs;
  final currentSession = SessionCollection().obs;

  void handleNewSessions(List<SessionCollection> newSessions) {
    sessions.value = newSessions;
  }

  void handleNewRecords(List<RecordCollection> newRecords) async {
    records.value = newRecords;
  }

  void handleDeletedRecords(List<RecordCollection> recordsToBeRestored) async {
    deletedRecords.value = recordsToBeRestored;
  }

  RxBool filterByInfraction = false.obs;

  RxBool filterByImagePath = false.obs;

  IconData getIcon(VehicleType type) {
    switch (type) {
      case VehicleType.largeTruck:
        {
          return Icons.local_shipping;
        }
      case VehicleType.motorBike:
        {
          return Icons.motorcycle;
        }
      case VehicleType.passenger:
        {
          return Icons.directions_car;
        }
      case VehicleType.transit:
        {
          return Icons.directions_bus;
        }
    }
  }

  String getType(VehicleType type) {
    switch (type) {
      case VehicleType.largeTruck:
        {
          return 'Truck';
        }
      case VehicleType.motorBike:
        {
          return 'Motor Bike';
        }
      case VehicleType.passenger:
        {
          return 'Passenger';
        }
      case VehicleType.transit:
        {
          return 'Transit';
        }
    }
  }

  String getSpeedRange(SpeedRange range) {
    int speedLimit = currentSession.value.speedLimit;
    int lowerLimit;
    int upperLimit;
    switch (range) {
      case SpeedRange.green:
        {
          lowerLimit = 0;
          upperLimit = speedLimit;
        }
        break;
      case SpeedRange.yellow:
        {
          lowerLimit = speedLimit + 1;
          upperLimit = speedLimit + 10;
        }
        break;
      case SpeedRange.orange:
        {
          lowerLimit = speedLimit + 11;
          upperLimit = speedLimit + 20;
        }
        break;

      case SpeedRange.red:
        {
          return 'Over ${speedLimit + 20}';
        }
    }
    return '${lowerLimit} to ${upperLimit}';
  }

  Color getColor(SpeedRange range) {
    switch (range) {
      case SpeedRange.green:
        return Colors.white;
      case SpeedRange.yellow:
        return Color(0xFFF9D96D);
      case SpeedRange.orange:
        return Color(0xFFF19838);
      case SpeedRange.red:
        return Color(0xFFE5466B);
    }
  }
}
