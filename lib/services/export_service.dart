import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:speedwatch/collections/record_collection.dart';
import 'package:collection/collection.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';
import 'db_service.dart';

class ExportService {


  void exportSessionToExcel(int sessionId) async {
    DbService dbService = Get.find();
    List<RecordCollection> records = await dbService.getRecordsWithIdOnly(sessionId);
    List<RecordCollection> infractionRecords = getInfractionRecords(records);

    List<RecordCollection> passengerRecords = [];
    List<RecordCollection> largeTruckRecords = [];
    List<RecordCollection> transitRecords = [];
    List<RecordCollection> motorBikeRecords = [];

    // each count will have one number per enum
    List<int> passengerCounts = [];
    List<int> largeTruckCounts = [];
    List<int> transitCounts = [];
    List<int> motorBikeCounts = [];


    var groupByType = groupBy(records,
            (obj) => (obj as RecordCollection).vehicleType);
    groupByType.forEach((vehicleType, groupedList) {
      switch(vehicleType) {
        case VehicleType.passenger:
          passengerRecords = groupedList;
          break;
        case VehicleType.largeTruck:
          largeTruckRecords = groupedList;
          break;
        case VehicleType.transit:
          transitRecords = groupedList;
          break;
        case VehicleType.motorBike:
          motorBikeRecords = groupedList;
          break;
      }
    });

    passengerCounts = getTypeCounts(passengerRecords);
    largeTruckCounts = getTypeCounts(largeTruckRecords);
    transitCounts = getTypeCounts(transitRecords);
    motorBikeCounts = getTypeCounts(motorBikeRecords);

    print(passengerCounts);

  }

  List<int> getTypeCounts(List<RecordCollection> records) {
    List<RecordCollection> greenRecords = [];
    List<RecordCollection> yellowRecords = [];
    List<RecordCollection> orangeRecords = [];
    List<RecordCollection> redRecords = [];
    var groupBySpeedRangeRecords = groupBy(records,
            (obj) => (obj as RecordCollection).speedRange);
    groupBySpeedRangeRecords.forEach((speedRange, groupedList) {
      switch (speedRange) {

        case SpeedRange.green:
          greenRecords = groupedList;
          break;
        case SpeedRange.yellow:
          yellowRecords = groupedList;
          break;
        case SpeedRange.orange:
          orangeRecords = groupedList;
          break;
        case SpeedRange.red:
          redRecords = groupedList;
          break;
      }
    });
    return [greenRecords.length, yellowRecords.length, orangeRecords.length, redRecords.length];
  }


  List<RecordCollection> getInfractionRecords(List<RecordCollection> records) {
    List<RecordCollection> infractionRecords = [];
    var groupByInfractionRecords = groupBy(records,
            (obj) => (obj as RecordCollection).speedRange);
    groupByInfractionRecords.forEach((speedRange, groupedList) {
      if (speedRange != SpeedRange.green) {
        infractionRecords += groupedList;
      }
    });
    return infractionRecords;
  }

  Future<Excel> getExcelTemplate() async {
    ByteData data = await rootBundle.load('lib/assets/templates/template.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel;
  }
}