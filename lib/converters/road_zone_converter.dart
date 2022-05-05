import 'package:isar/isar.dart';
import '../enums/road_zone.dart';

class RoadZoneConverter extends TypeConverter<RoadZone, int> {
  const RoadZoneConverter(); // Converters need to have an empty const constructor

  @override
  RoadZone fromIsar(int roadZoneIndex) {
    return RoadZone.values[roadZoneIndex];
  }

  @override
  int toIsar(RoadZone type) {
    return type.index;
  }
}