import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:speedwatch/controllers/home_controller.dart';

// ALWAYS remember to pass the `Type` you used to register your controller
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: MultiSplitViewTheme(
          data: MultiSplitViewThemeData(dividerThickness: 1),
          child: Obx(() => MultiSplitView(
                resizable: false,
                initialWeights: [0.3, 0.7],
                children: controller.masterDetailList.value,
              )),
        ));
  }
}
