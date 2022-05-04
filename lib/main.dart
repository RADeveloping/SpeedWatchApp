import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speedwatch/collections/session.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/screens/home_view.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'controllers/create_session_controller.dart';

void makeStatusBarTransparent() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
}

void main() async {
  makeStatusBarTransparent();
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    schemas: [SessionSchema],
    directory: dir.path,
    inspector: true,
  );
  runApp(MyApp(isar: isar,));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  MyApp({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    Get.put<SidebarController>(SidebarController());
    Get.put<CreateSessionController>(CreateSessionController());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: 'Speed Watch',
        home: HomeView(isar: isar,),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => HomeView(isar: isar,),
            transition: Transition.noTransition,
          ),
        ],
      ),
    );
  }
}
