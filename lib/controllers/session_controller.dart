import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../collections/session_collection.dart';
import '../collections/settings_collection.dart';
import '../enums/direction.dart';
import '../enums/road_condition.dart';
import '../enums/road_lighting.dart';
import '../enums/road_zone.dart';
import '../enums/weather.dart';
import '../services/db_service.dart';

class SessionController extends GetxController {
  RxList<SessionCollection> existingCollection = <SessionCollection>[].obs;

  RxSet<String> userListFromDatabase = <String>{}.obs;
  RxString title = 'Create Session'.obs;
  // Address
  RxString address = ''.obs;
  Rx<TextEditingController> address_textController =
      TextEditingController(text: '').obs;

  // Direction
  RxInt directionTag = 0.obs;
  List<String> directionOptions =
      Direction.values.map((val) => val.name).toList();

  // Volunteer
  Rx<TextEditingController> volunteer_textController =
      TextEditingController(text: '').obs;

  RxList<String> volunteerTags = <String>[].obs;
  RxList<String> volunteerOptions = <String>[].obs;

  final startEditDate = DateTime(0).obs;
  final endEditDate = DateTime(0).obs;

  // Road Zone
  RxInt roadZoneTag = 0.obs;
  List<String> roadZoneOptions =
      RoadZone.values.map((val) => val.name).toList();

  // Speed Limit

  RxInt speedLimitTag = 0.obs;
  List<String> speedLimitOptions = [
    '30',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
    '110',
    '120',
    '130',
  ];

  // Weather

  RxInt weatherTag = 2.obs;
  List<String> weatherOptions = Weather.values.map((val) => val.name).toList();

  // Road Conditions
  RxInt roadConditionTag = 0.obs;
  List<String> roadConditionOptions =
      RoadCondition.values.map((val) => val.name).toList();

  // Road Lighting
  RxInt roadLightingTag = 2.obs;
  List<String> roadLightingOptions =
      RoadLighting.values.map((val) => val.name).toList();

  void volunteerSearchValueChanged(String value) {
    if (value.isEmpty) {
      volunteerOptions.value =
          (volunteerTags.value + userListFromDatabase.value.toList())
              .toSet()
              .toList();
    } else {
      volunteerOptions.value = userListFromDatabase.value
          .where((element) => element.isCaseInsensitiveContains(value))
          .toList();
    }

    if (!volunteerOptions.contains(value) && !value.isEmpty) {
      volunteerOptions.add(value);
    }
  }

  SessionCollection getSession(DateTime startDate, DateTime endDate) {
    return SessionCollection()
      ..startTime = startDate
      ..endTime = endDate
      ..direction = Direction.values[directionTag.value]
      ..streetAddress = address_textController.value.text
      ..weatherOptions = Weather.values[weatherTag.value]
      ..roadConditionOptions = RoadCondition.values[roadConditionTag.value]
      ..roadLightingOptions = RoadLighting.values[roadLightingTag.value]
      ..roadZoneOptions = RoadZone.values[roadZoneTag.value]
      ..volunteerNames = volunteerTags.value
      ..speedLimit = int.parse(speedLimitOptions[speedLimitTag.value])
      ..hasExportedSession = false;
  }

  SessionCollection updateSession(DateTime startDate, DateTime endDate, SessionCollection currentSelection) {
    return currentSelection
      ..startTime = startDate
      ..endTime = endDate
      ..direction = Direction.values[directionTag.value]
      ..streetAddress = address_textController.value.text
      ..weatherOptions = Weather.values[weatherTag.value]
      ..roadConditionOptions = RoadCondition.values[roadConditionTag.value]
      ..roadLightingOptions = RoadLighting.values[roadLightingTag.value]
      ..roadZoneOptions = RoadZone.values[roadZoneTag.value]
      ..volunteerNames = volunteerTags.value
      ..speedLimit = int.parse(speedLimitOptions[speedLimitTag.value])
      ..hasExportedSession = false;
  }

  void setVolunteerOptions() async {
    DbService dbService = Get.find();
    volunteerOptions.value = await dbService.getCurrentSettingValue(0);
    userListFromDatabase.value = volunteerOptions.value.toSet();
  }

  Future<List<String>> getNewVolunteerNamesValue() async {
    DbService dbService = Get.find();
    SettingsCollection? currentSettings = await dbService.getCurrentSetting(0);
    List<String>? oldVolunteerTags = currentSettings?.value;
    if (oldVolunteerTags == null) {
      oldVolunteerTags = volunteerTags;
    } else {
      oldVolunteerTags.addAll(volunteerTags);
    }
    List<String> newVolunteerTags = oldVolunteerTags.toSet().toList();
    return newVolunteerTags;
  }

  void setEditSessionDetails(SessionCollection session) {
    address_textController.value.text = session.streetAddress;
    address.value = session.streetAddress;

    startEditDate.value = session.startTime;
    endEditDate.value = session.endTime;

    directionTag.value = session.direction.index;
    volunteerTags.value = session.volunteerNames.toList();

    // Road Zone
    roadZoneTag.value = session.roadZoneOptions.index;

    // Speed Limit
    speedLimitTag.value =
        speedLimitOptions.indexOf(session.speedLimit.toString());

    // Weather
    weatherTag.value = session.weatherOptions.index;

    // Road Conditions
    roadConditionTag.value = session.roadConditionOptions.index;

    // Road Lighting
    roadLightingTag.value = session.roadLightingOptions.index;
  }
}

class DateTimePickerController extends SessionController {
  Rx<DateTime> date;
  DateTimePickerController({required this.date}); // Start
  final DateFormat formatter = DateFormat('MMMM d, y h:mm aa');
}
