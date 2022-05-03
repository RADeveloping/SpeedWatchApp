import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateSessionController extends GetxController {
  RxString title = 'Create Session'.obs;
  List<String> directionOptions = ['North', 'East', 'South', 'West'];
  RxList<String> directionTags = <String>[].obs;

  Rx<DateTime> startDate = DateTime.now().obs;
  List<String> startOptions =
      [DateFormat('MMMM d, y h:mm aa').format(DateTime.now())].obs;
  RxList<String> startTags = <String>[].obs;

  Rx<DateTime> endDate = DateTime.now().add(Duration(hours: 1)).obs;
  List<String> endOptions = [
    DateFormat('MMMM d, y h:mm aa')
        .format(DateTime.now().add(Duration(hours: 1)))
  ].obs;
  RxList<String> endTags = <String>[].obs;

  List<String> volunteerOptions = [
    'Sandy Wesker',
    'Rahim Askarzadeh',
    'John Walker',
    'Sunwoo Park',
    'John Brady',
    'Medhat Elmasry',
    'Justin Jones'
  ];
  RxList<String> volunteerTags = <String>[].obs;

  List<String> roadZoneOptions = ['School', 'Construction', 'Highway', 'None'];
  RxList<String> roadZoneTags = <String>[].obs;

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
  RxList<String> speedLimitTags = <String>[].obs;

  List<String> weatherOptions = ['Sunny', 'Rainy', 'Cloudy'];
  RxList<String> weatherTags = <String>[].obs;

  List<String> roadConditionOptions = ['Dry', 'Wet', 'Snow'];
  RxList<String> roadConditionTags = <String>[].obs;

  List<String> roadLightingOptions = [
    'Dawn',
    'Day',
    'Dusk',
    'Artificial',
    'Night'
  ];
  RxList<String> roadLightingTags = <String>[].obs;

  Rx<TextEditingController> title_textController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> address_textController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> volunteer_textController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> speed_textController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> weather_textController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> road_conditions_textController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> visibility_textController =
      TextEditingController(text: '').obs;
}
