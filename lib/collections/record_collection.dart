import 'package:isar/isar.dart';

import '../converters/speed_range_converter.dart';
import '../converters/vehicle_type_converter.dart';
import '../enums/speed_range.dart';
import '../enums/vehicle_type.dart';

part 'record_collection.g.dart';

@Collection()
class RecordCollection {
  @Id()
  int id = Isar.autoIncrement;
  @Index()
  late DateTime createdAt;

  @Index()
  late DateTime? deletedAt;

  @SpeedRangeConverter()
  late SpeedRange speedRange;

  @VehicleTypeConverter()
  late VehicleType vehicleType;
  @Index()
  late int sessionId;
  late String volunteerName;

  late String? imagePath;
}
