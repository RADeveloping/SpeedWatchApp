import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateSessionController extends GetxController {
  RxString title = 'Create Session'.obs;
  List<String> directionOptions = ['North', 'East', 'South', 'West'];
  RxList<String> directionTags = <String>[].obs;

  List<String> startOptions = ['April 30, 2022', '10:00 AM'];
  RxList<String> startTags = <String>[].obs;

  List<String> endOptions = ['April 30, 2022', '1:00 PM'];
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
    '80',
    '90',
    '100',
    'Other'
  ];
  RxList<String> speedLimitTags = <String>[].obs;

  List<String> weatherOptions = ['Sunny', 'Rainy', 'Cloudy', 'Other'];
  RxList<String> weatherTags = <String>[].obs;

  List<String> roadConditionOptions = ['Dry', 'Wet', 'Snow', 'Other'];
  RxList<String> roadConditionTags = <String>[].obs;

  List<String> roadVisibilityOptions = ['Light', 'Dusk', 'Dawn', 'Other'];
  RxList<String> roadVisibilityTags = <String>[].obs;

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
