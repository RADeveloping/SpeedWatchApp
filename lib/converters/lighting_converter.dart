import 'package:isar/isar.dart';
import '../enums/road_lighting.dart';

class LightingConverter extends TypeConverter<RoadLighting, int> {
  const LightingConverter();

  @override
  RoadLighting fromIsar(int lightingIndex) {
    return RoadLighting.values[lightingIndex];
  }

  @override
  int toIsar(RoadLighting lighting) {
    return lighting.index;
  }

}