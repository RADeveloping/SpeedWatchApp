import 'package:isar/isar.dart';
import 'package:speedwatch/collections/session.dart';

import '../converters/speed_range_converter.dart';
import '../converters/vehicle_type_converter.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';

part 'record.g.dart';

@Collection()
class Record {
  @Id()
  int id = Isar.autoIncrement;
  @Index()
  late DateTime createdAt;

  @SpeedRangeConverter()
  late SpeedRange speedRange;

  @VehicleTypeConverter()
  late VehicleType vehicleType;
  final session = IsarLink<Session>();
}