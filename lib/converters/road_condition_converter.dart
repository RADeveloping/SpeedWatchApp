import 'package:isar/isar.dart';
import '../enums/road_condition.dart';

class RoadConditionConverter extends TypeConverter<RoadCondition, int> {
  const RoadConditionConverter(); // Converters need to have an empty const constructor

  @override
  RoadCondition fromIsar(int roadConditionOptionsIndex) {
    return RoadCondition.values[roadConditionOptionsIndex];
  }

  @override
  int toIsar(RoadCondition type) {
    return type.index;
  }
}