import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class ExportService {
  Future<Excel> getExcelTemplate() async {
    ByteData data = await rootBundle.load('lib/assets/templates/template.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      if (excel.tables[table]?.rows != null) {
        for (var row in excel.tables[table]!.rows) {
          print('$row');
        }
      }
    }

    return excel;
  }
}