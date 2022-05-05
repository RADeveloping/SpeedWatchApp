import 'package:isar/isar.dart';
import '../enums/speed_range.dart';

class SpeedRangeConverter extends TypeConverter<SpeedRange, int> {
  const SpeedRangeConverter(); // Converters need to have an empty const constructor

  @override
  SpeedRange fromIsar(int speedRangeIndex) {
    return SpeedRange.values[speedRangeIndex];
  }

  @override
  int toIsar(SpeedRange type) {
    return type.index;
  }
}