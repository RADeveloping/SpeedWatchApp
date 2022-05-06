import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:speedwatch/controllers/home_controller.dart';

// ALWAYS remember to pass the `Type` you used to register your controller
class HomeView extends GetView<HomeController> {
  final Widget? leftChild;
  final Widget? rightChild;

  HomeView({this.leftChild, this.rightChild}) {
    if (leftChild != null) {
      controller.children.value[0] = leftChild!;
    }
    if (rightChild != null) {
      controller.children.value[1] = rightChild!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: MultiSplitViewTheme(
          data: MultiSplitViewThemeData(dividerThickness: 1),
          child: MultiSplitView(
              resizable: false,
              initialWeights: [0.3, 0.7],
              children: controller.children.value),
        )));
  }
}
