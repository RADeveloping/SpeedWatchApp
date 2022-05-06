import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:speedwatch/collections/record_collection.dart';
import 'package:speedwatch/collections/session_collection.dart';
import 'package:speedwatch/enums/speed_range.dart';
import 'package:speedwatch/enums/vehicle_type.dart';

class RecordController extends GetxController {
  RecordCollection getRecord(SpeedRange speedRange, VehicleType vehicleType, SessionCollection session) {
    return RecordCollection()
        ..createdAt = DateTime.now()
        ..speedRange = speedRange
        ..vehicleType = vehicleType
        ..session.value = session;
  }

  void writeRecordToDB(SpeedRange speedRange, VehicleType vehicleType, int sessionID) async {
    Isar db = Get.find();
    final currentSession = await db.sessionCollections.get(sessionID);
    await db.writeTxn(((isar) async {
      await db.recordCollections.put(getRecord(speedRange, vehicleType, currentSession!));
    }));
  }
}