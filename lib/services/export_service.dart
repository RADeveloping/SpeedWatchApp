import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/collections/record_collection.dart';
import 'package:collection/collection.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';
import 'db_service.dart';

class ExportService {


  void exportSessionToExcel(int sessionId) async {
    Excel excel = await getExcelTemplate();
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
    
    excel = setExcelTableRow(['B4', 'C4', 'D4', 'E4', 'F4'], passengerCounts, excel);
    excel = setExcelTableRow(['B5', 'C5', 'D5', 'E5', 'F5'], largeTruckCounts, excel);
    excel = setExcelTableRow(['B6', 'C6', 'D6', 'E6', 'F6'], transitCounts, excel);
    excel = setExcelTableRow(['B7', 'C7', 'D7', 'E7', 'F7'], motorBikeCounts, excel);
    await saveExcel('ass', excel);

  }

  Future<void> saveExcel(String fileName, Excel excel) async {
    var fileBytes = excel.save();
    var directory = await getApplicationDocumentsDirectory();

    File(join('${directory}/${fileName}.xlsx'))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
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
}