import 'package:isar/isar.dart';
import 'package:speedwatch/enums/road_condition_options.dart';
import 'package:speedwatch/enums/road_lighting_option.dart';
import 'package:speedwatch/enums/road_zone_options.dart';
import 'package:speedwatch/enums/weather_condition_options.dart';

import '../converters/direction_converter.dart';
import '../converters/lighting_converter.dart';
import '../enums/direction.dart';

part 'session.g.dart';

@Collection()
class Session {
  @Id()
  int id = Isar.autoIncrement;
  late String streetAddress;
  @DirectionConverter()
  late Direction direction;
  @Index()
  late DateTime startTime;
  late DateTime endTime;
  late List<String> volunteerNames;
  late RoadZoneOptions roadZoneOptions;
  late int speedLimit;
  late WeatherOptions weatherOptions;
  late RoadConditionOptions roadConditionOptions;

  @LightingConverter()
  late RoadLightingOptions roadLightingOptions;
}