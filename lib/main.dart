import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speedwatch/components/rightpane.dart';
import 'package:speedwatch/components/session.dart';
import 'package:speedwatch/components/sidebar.dart';
import 'package:speedwatch/collections/session_collection.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/screens/home_view.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/services/db_service.dart';

import 'controllers/session_controller.dart';

Future<void> main() async {
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
    Get.put<SessionController>(SessionController());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetCupertinoApp(
        defaultTransition: Transition.cupertino,
        title: 'Speed Watch',
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: HomeView(
          leftChild: Sidebar(),
          rightChild: RightPane(),
        ),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeView(
              leftChild: Sidebar(),
              rightChild: RightPane(),
            ),
            transition: Transition.noTransition,
          ),
          GetPage(
            name: '/create',
            page: () => HomeView(
              leftChild: Sidebar(),
              rightChild: Session(
                title: 'Create Session',
                submitButtonText: 'Create Session',
              ),
            ),
            transition: Transition.noTransition,
          ),
          GetPage(
            name: '/session/:sessionID',
            page: () => HomeView(
              leftChild: Sidebar(),
              rightChild: Session(
                title: 'Create Session',
                submitButtonText: 'Create Session',
              ),
            ),
            transition: Transition.noTransition,
          ),
        ],
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
