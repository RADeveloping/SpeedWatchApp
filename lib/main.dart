import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/components/rightpane.dart';
import 'package:speedwatch/components/sidebar.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import 'components/logs_list.dart';
import 'components/session.dart';
import 'components/session_detail.dart';
import 'components/sessions_list.dart';
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
              page: () => Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Sidebar(
                          child: SessionsList(),
                        ),
                      ),
                      Expanded(flex: 2, child: RightPane()),
                    ],
                  ),
              transition: Transition.noTransition,
              binding: BindingsBuilder(() => {Get.put(SidebarController())}),
              title: 'Sessions'),
          GetPage(
            name: '/Logs/:sessionID',
            page: () => Row(
              children: [
                Sidebar(
                  child: LogsList(),
                ),
                Expanded(child: SessionDetail()),
              ],
            ),
            title: 'Sessions',
          ),
          GetPage(
              name: '/create',
              page: () => Session(
                    title: 'Create',
                    submitButtonText: 'Create Session',
                  ),
              title: 'Create Session'),
          GetPage(
            name: '/edit',
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
