import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/home_controller.dart';

// ALWAYS remember to pass the `Type` you used to register your controller
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child:
              Text(controller.title.value), // just call `controller.something`
        ),
      ),
    );
  }
}
