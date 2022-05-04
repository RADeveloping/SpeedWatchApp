import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speedwatch/collections/session.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/screens/home_view.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/services/db_service.dart';

import 'controllers/create_session_controller.dart';

void makeStatusBarTransparent() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
}

Future<void> main() async {
  makeStatusBarTransparent();
  runApp(MyApp());
  await initServices();
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => DbService().init());
  print('All services started...');
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    Get.put<SidebarController>(SidebarController());
    Get.put<CreateSessionController>(CreateSessionController());

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
