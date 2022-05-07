import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speedwatch/components/rightpane.dart';
import 'package:speedwatch/components/session.dart';
import 'package:speedwatch/components/sidebar.dart';
import 'package:speedwatch/collections/session_collection.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/screens/home_view.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speedwatch/services/db_service.dart';

import 'components/logs_list.dart';
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
    Get.put<SessionController>(SessionController());
    Get.put<HomeController>(HomeController());
    Get.put<SidebarController>(SidebarController());
    Get.put(() => DbService(), permanent: true);

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
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeView(
              leftChild: Sidebar(
                child: SessionsList(),
                largeTitle: 'Sessions',
              ),
              rightChild: RightPane(),
            ),
            preventDuplicates: true,
            transition: Transition.noTransition,
          ),
          GetPage(
            name: '/create',
            page: () => HomeView(
              leftChild: null,
              rightChild: Session(
                title: 'Create Session',
                submitButtonText: 'Create Session',
              ),
            ),
            transition: Transition.noTransition,
            preventDuplicates: false,
          ),
          GetPage(
            name: '/session/:sessionID',
            page: () => HomeView(
              leftChild: Sidebar(
                leading: CupertinoButton(
                  padding: EdgeInsetsDirectional.zero,
                  onPressed: () {
                    Get.offAndToNamed('/');
                  },
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.back,
                        color: kColourLight,
                      ),
                    ],
                  ),
                ),
                largeTitle: 'Log',
                previousPageTitle: 'Sessions',
                child: LogsList(),
              ),
              rightChild: SessionDetail(),
            ),
            transition: Transition.noTransition,
            preventDuplicates: true,
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
