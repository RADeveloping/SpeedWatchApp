import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/collections/record_collection.dart';
import 'package:collection/collection.dart';
import 'package:speedwatch/components/session.dart';
import '../collections/session_collection.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';
import 'db_service.dart';

class ExportService {
  Future<List<String>> exportSessionsToExcel(List<SessionCollection> sessions) async {
    List<String> directories = [];
    for(var session in sessions) {
      directories.add(await exportSessionToExcel(session));
    }
    return directories;
  }

  Future<String> exportSessionToExcel(SessionCollection session) async {
    Excel excel = await getExcelTemplate();
    DbService dbService = Get.find();
    List<RecordCollection> records = await dbService.getRecordsWithIdOnly(session.id);
    // SessionCollection session = await dbService.getSessionsWithIdOnly(sessionId) as SessionCollection;
    // List<RecordCollection> infractionRecords = getInfractionRecords(records);

    List<RecordCollection> passengerRecords = [];
    List<RecordCollection> largeTruckRecords = [];
    List<RecordCollection> transitRecords = [];
    List<RecordCollection> motorBikeRecords = [];

    // each count will have one number per enum
    List<int> passengerCounts = [];
    List<int> largeTruckCounts = [];
    List<int> transitCounts = [];
    List<int> motorBikeCounts = [];
    List<int> speedRangeTotals = [];
    List<String> speedRangeTitles = [];


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
    speedRangeTotals = getSpeedRangeTotals(passengerCounts, largeTruckCounts, transitCounts, motorBikeCounts);
    speedRangeTitles = getSpeedRangeTitles(session.speedLimit);

    excel = setExcelTableRowString(['E2', 'F2', 'G2', 'H2'], speedRangeTitles, excel);
    excel = setExcelTableRow(['E3', 'F3', 'G3', 'H3', 'I3'], passengerCounts, excel);
    excel = setExcelTableRow(['E4', 'F4', 'G4', 'H4', 'I4'], largeTruckCounts, excel);
    excel = setExcelTableRow(['E5', 'F5', 'G5', 'H5', 'I5'], transitCounts, excel);
    excel = setExcelTableRow(['E6', 'F6', 'G6', 'H6', 'I6'], motorBikeCounts, excel);
    excel = setExcelTableRow(['E7', 'F7', 'G7', 'H7', 'I7'], speedRangeTotals, excel);
    return await saveExcel(getFileName(session), excel);

  }

  String getFileName(SessionCollection session) {
    return 'SpeedWatch ${session.streetAddress} ${DateFormat('M-d-y h.mm aa').format(session.startTime)}';
  }

  List<String> getSpeedRangeTitles(int speedLimit) {
    int lowerLimit = 0;
    int upperLimit = 0;
    String title;
    List<String> output = [];
    for (SpeedRange range in SpeedRange.values) {
      switch (range) {
        case SpeedRange.green: {
          lowerLimit = 0;
          upperLimit = speedLimit;
          title = '${lowerLimit} to ${upperLimit}';
        }
        break;
        case SpeedRange.yellow: {
          lowerLimit = speedLimit + 1;
          upperLimit = speedLimit + 10;
          title = '${lowerLimit} to ${upperLimit}';
        }
        break;
        case SpeedRange.orange: {
          lowerLimit = speedLimit + 11;
          upperLimit = speedLimit + 20;
          title = '${lowerLimit} to ${upperLimit}';
        }
        break;
        case SpeedRange.red: {
          title = 'Over ${speedLimit + 20}';
        }
        break;
      }
      output.add(title);
    }
    return output;
  }

  List<int> getSpeedRangeTotals(List<int> passengerCounts, List<int> largeTruckCounts, List<int> transitCounts, List<int> motorBikeCounts) {
    List<int> output = List<int>.filled(5, 0);
    for (int i = 0; i < 5; i++) {
      var sum = passengerCounts[i] + largeTruckCounts[i] +  transitCounts[i] + motorBikeCounts[i];
      output[i] = sum;
    }
    return output;
  }

  Future<String> saveExcel(String fileName, Excel excel) async {
    var fileBytes = excel.save();
    var directory = await getApplicationDocumentsDirectory();

    File(join('${directory.path}/${fileName}.xlsx'))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    return '${directory.path}/${fileName}.xlsx';
  }

  void printExcel(Excel excel) {
    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]?.maxCols);
      print(excel.tables[table]?.maxRows);

      if (excel.tables[table]?.rows != null) {
        for (var row in excel.tables[table]!.rows) {
          print('$row');
        }
      }

    }
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
    int total = greenRecords.length + yellowRecords.length + orangeRecords.length + redRecords.length;
    return [greenRecords.length, yellowRecords.length, orangeRecords.length, redRecords.length, total];
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

  Excel setExcelTableRow(List<String> indexes, List<int> values, Excel excel) {
    Sheet sheetObject = excel['Sheet1'];
    for (int i = 0; i < indexes.length; i++) {
      sheetObject.cell(CellIndex.indexByString(indexes[i])).value = values[i];
    }
    return excel;
  }

  Excel setExcelTableRowString(List<String> indexes, List<String> values, Excel excel) {
    Sheet sheetObject = excel['Sheet1'];
    for (int i = 0; i < indexes.length; i++) {
      sheetObject.cell(CellIndex.indexByString(indexes[i])).value = values[i];
    }
    return excel;
  }
}