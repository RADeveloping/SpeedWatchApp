import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString title = 'Home'.obs;
  RxList<double> weights = [0.347, 0.653].obs;
  RxList<Widget> children = <Widget>[].obs;
}
