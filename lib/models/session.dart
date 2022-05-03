import 'package:isar/isar.dart';
import 'package:speedwatch/enums/direction.dart';
import 'package:speedwatch/enums/road_condition.dart';

import '../converters/direction_converter.dart';
import '../converters/lighting_converter.dart';
import '../enums/lighting.dart';
import '../enums/road_zone.dart';
import '../enums/weather.dart';

@Collection()
class Session {
  @Id()
  int? id;

  late int speedLimit;
  late DateTime createdAt;
  late List<String> volunteers;

  late String address;
  @DirectionConverter()
  late Direction direction;

  @LightingConverter()
  late Lighting lighting;

  late RoadCondition roadCondition;

  late RoadZone roadZone;

  late Weather weather;
}