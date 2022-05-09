import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:speedwatch/controllers/home_controller.dart';

// ALWAYS remember to pass the `Type` you used to register your controller
class HomeView extends GetView<HomeController> {
  final Widget? leftChild;
  final Widget? rightChild;

  HomeView({this.leftChild, required this.rightChild}) {
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
              controller: MultiSplitViewController(
                  weights:
                      context.isPortrait ? [0.417, 0.583] : [0.347, 0.653]),
              resizable: true,
              initialWeights:
                  context.isPortrait ? [0.417, 0.583] : [0.347, 0.653],
              children: leftChild == null && context.isPortrait
                  ? [controller.children.value[1]]
                  : controller.children.value),
        )));
  }
}
