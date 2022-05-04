import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../enums/direction.dart';
import '../enums/road_condition.dart';
import '../enums/road_lighting.dart';
import '../enums/road_zone.dart';
import '../enums/weather.dart';

class CreateSessionController extends GetxController {
  RxSet<String> mockUserListFromDatabase = {
    'Sandy Wesker',
    'Rahim Askarzadeh',
    'John Walker',
    'Sunwoo Park',
    'John Brady',
    'Medhat Elmasry',
    'Justin Jones',
  }.obs;

  void volunteerSearchValueChanged(String value) {
    if (value.isEmpty) {
      volunteerOptions.value =
          (volunteerTags.value + mockUserListFromDatabase.value.toList())
              .toSet()
              .toList();
    } else {
      volunteerOptions.value = mockUserListFromDatabase.value
          .toList()
          .where((element) => element.isCaseInsensitiveContains(value))
          .toList();
    }

    if (!volunteerOptions.contains(value) && !value.isEmpty) {
      volunteerOptions.add(value);
    }
  }

  RxString title = 'Create Session'.obs;

  // Address
  Rx<TextEditingController> address_textController =
      TextEditingController(text: '').obs;

  // Direction
  RxInt directionTag = 0.obs;
  List<String> directionOptions = Direction.values.map((val) => val.name).toList();

  // Start
  Rx<DateTime> startDate = DateTime.now().obs;
  RxInt startTag = 0.obs;
  RxList<String> startOptions =
      [DateFormat('MMMM d, y h:mm aa').format(DateTime.now())].obs;

  // End
  Rx<DateTime> endDate = DateTime.now().add(Duration(hours: 1)).obs;
  RxInt endTag = 0.obs;
  RxList<String> endOptions = [
    DateFormat('MMMM d, y h:mm aa')
        .format(DateTime.now().add(Duration(hours: 1)))
  ].obs;

  // Volunteer
  Rx<TextEditingController> volunteer_textController =
      TextEditingController(text: '').obs;

  RxList<String> volunteerTags = <String>[].obs;
  RxList<String> volunteerOptions = [
    'Sandy Wesker',
    'Rahim Askarzadeh',
    'John Walker',
  ].obs;

  // Road Zone
  RxInt roadZoneTag = 0.obs;
  List<String> roadZoneOptions = RoadZone.values.map((val) => val.name).toList();

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
  List<String> roadConditionOptions = RoadCondition.values.map((val) => val.name).toList();

  // Road Lighting
  RxInt roadLightingTag = 2.obs;
  List<String> roadLightingOptions = RoadLighting.values.map((val) => val.name).toList();
}
