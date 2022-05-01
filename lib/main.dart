import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/screens/home_view.dart';

void makeStatusBarTransparent() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
}

void main() {
  makeStatusBarTransparent();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    Get.put<SidebarController>(SidebarController());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: 'Speed Watch',
        home: HomeView(),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeView(),
            transition: Transition.noTransition,
          ),
        ],
      ),
    );
  }
}
