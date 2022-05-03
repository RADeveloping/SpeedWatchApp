import 'package:isar/isar.dart';
import '../enums/road_lighting_option.dart';

class LightingConverter extends TypeConverter<RoadLightingOptions, int> {
  const LightingConverter();

  @override
  RoadLightingOptions fromIsar(int lightingIndex) {
    return RoadLightingOptions.values[lightingIndex];
  }

  @override
  int toIsar(RoadLightingOptions lighting) {
    return lighting.index;
  }

}