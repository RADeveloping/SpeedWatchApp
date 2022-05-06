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

class SessionController extends GetxController {
  RxSet<String> userListFromDatabase = <String>{}.obs;

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

  RxString title = 'Create Session'.obs;

  RxString address = ''.obs;

  // Address
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

  void writeSessionToDB(DateTime startDate, DateTime endDate) async {
    if (address_textController.value.toString().length > 0 &&
        volunteerTags.value.isNotEmpty) {
      Isar db = Get.find();
      SettingsCollection newSettings = await getNewSetting(db);

      await db.writeTxn(((isar) async {
        await db.sessionCollections.put(getSession(startDate, endDate));
        await db.settingsCollections.put(newSettings);
      }));
    }
  }

  Future<SettingsCollection> getNewSetting(Isar db) async {
    SettingsCollection? currentSettings = await getCurrentSetting(db, 0);
    List<String>? oldVolunteerTags = currentSettings?.value;
    if (oldVolunteerTags == null) {
      oldVolunteerTags = volunteerTags;
    } else {
      oldVolunteerTags.addAll(volunteerTags);
    }
    List<String> newVolunteerTags = oldVolunteerTags.toSet().toList();
    SettingsCollection newSettings = SettingsCollection()
      ..id = 0
      ..value = newVolunteerTags
      ..key = 'names';
    return newSettings;
  }

  Future<SettingsCollection?> getCurrentSetting(Isar db, int id) async {
    return await db.settingsCollections.get(id);
  }

  Future<List<String>> getCurrentVolunteerOptions(Isar db) async {
    SettingsCollection? currentSettings = await db.settingsCollections.get(0);
    List<String> output = [];
    if (currentSettings != null) {
      output = currentSettings.value;
    }
    return output;
  }

  void setVolunteerOptions() async {
    Isar db = Get.find();
    volunteerOptions.value = await getCurrentVolunteerOptions(db);
    userListFromDatabase.value = volunteerOptions.value.toSet();
  }
}

class DateTimePickerController extends SessionController {
  Rx<DateTime> date;
  DateTimePickerController({required this.date}); // Start
  final DateFormat formatter = DateFormat('MMMM d, y h:mm aa');
}
