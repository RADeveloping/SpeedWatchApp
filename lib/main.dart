import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/screens/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());

    return GetMaterialApp(
      title: 'Speed Watch',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        navigationBarTheme: ThemeData.dark()
            .navigationBarTheme
            .copyWith(backgroundColor: Colors.blue),
      ),
      home: HomeView(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeView(),
          transition: Transition.noTransition,
        ),
      ],
    );
  }
}
