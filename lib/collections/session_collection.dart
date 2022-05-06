
import 'package:isar/isar.dart';
import 'package:speedwatch/collections/record_collection.dart';
import 'package:speedwatch/enums/road_condition.dart';
import 'package:speedwatch/enums/road_lighting.dart';
import 'package:speedwatch/enums/road_zone.dart';
import 'package:speedwatch/enums/weather.dart';

import '../converters/direction_converter.dart';
import '../converters/lighting_converter.dart';
import '../converters/road_condition_converter.dart';
import '../converters/road_zone_converter.dart';
import '../converters/weather_converter.dart';
import '../enums/direction.dart';

part 'session_collection.g.dart';

@Collection()
class SessionCollection {
  @Id()
  int id = Isar.autoIncrement;
  late String streetAddress;
  @DirectionConverter()
  late Direction direction;
  @Index()
  late DateTime startTime;
  late DateTime endTime;
  late List<String> volunteerNames;
  @RoadZoneConverter()
  late RoadZone roadZoneOptions;
  late int speedLimit;
  @WeatherConverter()
  late Weather weatherOptions;
  @RoadConditionConverter()
  late RoadCondition roadConditionOptions;
  @LightingConverter()
  late RoadLighting roadLightingOptions;
  late bool hasExportedSession;
  @Backlink(to: 'session')
  final records = IsarLinks<RecordCollection>();
}
