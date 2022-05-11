import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/components/rightpane.dart';
import 'package:speedwatch/components/sessions_list.dart';
import 'package:speedwatch/components/sidebar.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/screens/home_view.dart';
import 'package:speedwatch/services/db_service.dart';

import 'components/logs_list.dart';
import 'components/session.dart';
import 'components/session_detail.dart';
import 'controllers/session_controller.dart';

// Global variable for storing the list of cameras available
List<CameraDescription> cameras = [];

Future<void> main() async {
  // Fetch the available cameras before initializing the app
  runApp(MyApp());
  await initServices();
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => DbService().init(), permanent: true);
  print('All services started...');
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetCupertinoApp(
        defaultTransition: Transition.noTransition,
        title: 'Speed Watch',
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: kColourLight,
          scaffoldBackgroundColor: kColourSidebarBackground,
        ),
        initialRoute: '/Sessions',
        getPages: [
          GetPage(
            name: '/Sessions',
            page: () {
              return HomeView(
                leftChild: Sidebar(
                  child: SessionsList(),
                  largeTitle: 'Sessions',
                ),
                rightChild: RightPane(),
              );
            },
            binding: BindingsBuilder(() => {Get.put(SidebarController())}),
          ),
          GetPage(
            name: '/Logs/:sessionID',
            page: () {
              return HomeView(
                leftChild: Sidebar(
                  child: LogsList(),
                  largeTitle: 'Logs',
                ),
                rightChild: SessionDetail(),
              );
            },
          ),
          GetPage(
              name: '/Create',
              page: () => Session(
                    title: 'Create',
                    submitButtonText: 'Create Session',
                  ),
              title: 'Create Session'),
          GetPage(
            name: '/Edit',
            page: () => Session(
              title: 'Edit Session',
              submitButtonText: 'Update Session',
            ),
          ),
        ],
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        initialBinding: BindingsBuilder(() {
          Get.put<SessionController>(SessionController());
          Get.put<HomeController>(HomeController());
          Get.put<SidebarController>(SidebarController());
          Get.put<SessionDetailDetailController>(
              SessionDetailDetailController());
        }),
      ),
    );
  }
}
