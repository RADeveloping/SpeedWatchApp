import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:speedwatch/controllers/home_controller.dart';

import '../components/rightpane.dart';
import '../components/sidebar.dart';

// ALWAYS remember to pass the `Type` you used to register your controller
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiSplitViewTheme(
      data: MultiSplitViewThemeData(dividerThickness: 1),
      child: MultiSplitView(
        resizable: false,
        initialWeights: [0.3, 0.7],
        children: [
          Sidebar(),
          RightPane(),
        ],
      ),
    ));
  }
}
