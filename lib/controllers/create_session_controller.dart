import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  List<String> directionOptions = ['North', 'East', 'South', 'West'];

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
  List<String> roadZoneOptions = ['School', 'Construction', 'Highway', 'None'];

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
  List<String> weatherOptions = ['Sunny', 'Rainy', 'Cloudy'];

  // Road Conditions
  RxInt roadConditionTag = 0.obs;
  List<String> roadConditionOptions = ['Dry', 'Wet', 'Snow'];

  // Road Lighting
  RxInt roadLightingTag = 2.obs;
  List<String> roadLightingOptions = [
    'Dawn',
    'Day',
    'Dusk',
    'Artificial',
    'Night'
  ];
}

class DateTimePickerController extends CreateSessionController {
  Rx<DateTime> date;
  DateTimePickerController({required this.date}); // Start

  // date = DateTime.now().obs;
  // RxInt tag = 0.obs;
  // RxList<String> options =
  //     [DateFormat('MMMM d, y h:mm aa').format(DateTime.now())].obs;

  final DateFormat formatter = DateFormat('MMMM d, y h:mm aa');
}
