import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:speedwatch/controllers/home_controller.dart';

// ALWAYS remember to pass the `Type` you used to register your controller
class HomeView extends GetView<HomeController> {
  Widget leftChild = Container();
  Widget rightChild = Container();

  HomeView({required this.leftChild, required this.rightChild});

  @override
  Widget build(BuildContext context) {
    return MultiSplitViewTheme(
      data: MultiSplitViewThemeData(dividerThickness: 1),
      child: Container(
        child: MultiSplitView(
            controller: MultiSplitViewController(
                weights: context.isPortrait ? [0.417, 0.583] : [0.347, 0.653]),
            resizable: true,
            initialWeights:
                context.isPortrait ? [0.417, 0.583] : [0.347, 0.653],
            children: [leftChild, rightChild]),
      ),
    );
  }
}
