import 'package:isar/isar.dart';
import '../enums/direction.dart';

class DirectionConverter extends TypeConverter<Direction, int> {
  const DirectionConverter(); // Converters need to have an empty const constructor

  @override
  Direction fromIsar(int directionIndex) {
    return Direction.values[directionIndex];
  }

  @override
  int toIsar(Direction direction) {
    return direction.index;
  }
}