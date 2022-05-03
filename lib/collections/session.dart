import 'package:isar/isar.dart';
import 'package:speedwatch/enums/road_condition_options.dart';
import 'package:speedwatch/enums/road_lighting_option.dart';
import 'package:speedwatch/enums/road_zone_options.dart';
import 'package:speedwatch/enums/weather_condition_options.dart';

part 'session.g.dart';

@Collection()
class Session {
  @Id()
  int id = Isar.autoIncrement;
  late String streetAddress;
  late List<String> direction;

  @Index()
  late DateTime startTime;

  late DateTime endTime;
  late List<String> volunteerNames;
  late RoadZoneOptions roadZoneOptions;
  late String speedLimit;
  late WeatherOptions weatherOptions;
  late RoadConditionOptions roadConditionOptions;
  late RoadLightingOptions roadLightingOptions;
}