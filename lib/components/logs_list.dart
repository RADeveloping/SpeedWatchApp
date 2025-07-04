import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:popover/popover.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import '../collections/record_collection.dart';
import '../constants.dart';
import '../enums/speed_range.dart';

class LogsList extends GetView<SidebarController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() => SettingsList(
                applicationType: ApplicationType.both,
                brightness: Brightness.light,
                lightTheme: SettingsThemeData(
                  settingsListBackground: kColourSidebarBackground,
                  settingsSectionBackground: Colors.transparent,
                  settingsTileTextColor: kColourSidebarTileText,
                  tileHighlightColor: kColourLight,
                  dividerColor: kColourTileDivider,
                ),
                sections: [buildSection(context)],
              )),
        ),
        Obx(() => controller.records.isEmpty
            ? Expanded(
                child: Text(
                  'No Logs',
                  style: TextStyle(
                      color: kColourPlaceHolderText,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Container()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          Obx(() => Text(
                                '${controller.records.value.length}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              )),
                          Text(
                            'Records',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.filterByInfraction.value
                          ? kColourRightPaneBackground
                          : Colors.transparent),
                  child: CupertinoButton(
                    padding: const EdgeInsets.only(),
                    onPressed: () {
                      controller.filterByInfraction.toggle();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          Obx(() => Text('${getInfractionCount()}',
                              style: TextStyle(
                                  color: controller.filterByInfraction.value
                                      ? kColourLight
                                      : Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold))),
                          Obx(() => Text(
                                'Infractions',
                                style: TextStyle(
                                    color: controller.filterByInfraction.value
                                        ? kColourLight
                                        : Colors.white54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.filterByImagePath.value
                          ? kColourRightPaneBackground
                          : Colors.transparent),
                  child: CupertinoButton(
                    padding: const EdgeInsets.only(),
                    onPressed: () {
                      if (getRecordsWithImage().isEmpty ||
                          getInfractionRecordsWithImage().isEmpty) {
                        null;
                      }
                      controller.filterByImagePath.toggle();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          Obx(() => Text('${getImageCount()}',
                              style: TextStyle(
                                  color: controller.filterByImagePath.value
                                      ? kColourLight
                                      : Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold))),
                          Obx(() => Text(
                                'Photos',
                                style: TextStyle(
                                    color: controller.filterByImagePath.value
                                        ? kColourLight
                                        : Colors.white54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }

  AbstractSettingsSection buildSection(BuildContext context) {
    return SettingsSection(
      margin: EdgeInsetsDirectional.zero,
      title: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.currentSession.value.streetAddress
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${DateFormat('M/d/y h:mm aa').format(controller.currentSession.value.startTime).toUpperCase()} - ${DateFormat('M/d/y h:mm aa').format(controller.currentSession.value.endTime).toUpperCase()}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      tiles: populateLogListTiles(context),
    );
  }

  SettingsTile moreItems(List<RecordCollection> records) {
    if (records.length > controller.limitRecords.value) {
      return SettingsTile(
        title: Center(
            child: Text(
          'Load More',
          style: TextStyle(color: kColourLight),
        )),
        onPressed: (c) {
          controller.limitRecords.value += 20;
        },
      );
    }
    return SettingsTile(
      title: Text(''),
    );
  }

  SettingsTile moreInfractionItems(List<RecordCollection> list) {
    if (list.length > controller.limitRecords.value) {
      return SettingsTile(
        title: Center(
            child: Text(
          'Load More',
          style: TextStyle(color: kColourLight),
        )),
        onPressed: (c) {
          controller.limitRecords.value += 20;
        },
      );
    }
    return SettingsTile(
      title: Text(''),
    );
  }

  SettingsTile recordItem(RecordCollection record, BuildContext context) {
    return SettingsTile(
      trailing: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              controller.getSpeedRange(record.speedRange),
              style: TextStyle(color: kColourPlaceHolderText),
            ),
          ),
          LogsTileMoreButton(
            recordCollection: record,
          ),
        ],
      ),
      leading: Icon(
        controller.getIcon(record.vehicleType),
        color: controller.getColor(record.speedRange),
      ),
      title: Column(
        children: [
          Text(
            DateFormat('hh:mm:ss a').format(record.createdAt),
            style: kTextStyleSidebarTile,
          ),
          Text(
            controller.getType(record.vehicleType),
            style: kTextStyleTilePlaceholder,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      description: record.imagePath != null
          ? GestureDetector(
              onTap: () {
                showImage(context, File(record.imagePath!));
              },
              child: Image.file(File(record.imagePath!)),
            )
          : null,
    );
  }

  int getInfractionCount() {
    return controller.records
        .where((record) => record.speedRange != SpeedRange.green)
        .length;
  }

  int getImageCount() {
    return controller.records
        .where((record) => record.imagePath != null)
        .length;
  }

  void showImage(BuildContext context, File file) {
    final imageProvider = Image.file(file).image;
    showImageViewer(context, imageProvider);
  }

  List<RecordCollection> getInfractionRecords() {
    return controller.records
        .where((record) => record.speedRange != SpeedRange.green)
        .toList();
  }

  List<RecordCollection> getRecordsWithImage() {
    return controller.records
        .where((record) => record.imagePath != null)
        .toList();
  }

  List<RecordCollection> getInfractionRecordsWithImage() {
    return controller.records
        .where((record) =>
            record.imagePath != null && record.speedRange != SpeedRange.green)
        .toList();
  }

  List<AbstractSettingsTile> populateLogListTiles(BuildContext context) {
    if (controller.filterByInfraction.isTrue &&
        controller.filterByImagePath.isFalse) {
      return (getInfractionRecords()
              .take(controller.limitRecords.value)
              .map((record) => recordItem(record, context))
              .toList() +
          [moreItems(getInfractionRecords())]);
    } else if (controller.filterByImagePath.isTrue &&
        controller.filterByInfraction.isFalse) {
      return (getRecordsWithImage()
              .take(controller.limitRecords.value)
              .map((record) => recordItem(record, context))
              .toList() +
          [moreItems(getRecordsWithImage())]);
    } else if (controller.filterByInfraction.isTrue &&
        controller.filterByImagePath.isTrue) {
      return (getInfractionRecordsWithImage()
              .take(controller.limitRecords.value)
              .map((record) => recordItem(record, context))
              .toList() +
          [moreItems(getInfractionRecordsWithImage())]);
    } else if (controller.filterByInfraction.isFalse &&
        controller.filterByImagePath.isFalse) {
      return (controller.records
              .take(controller.limitRecords.value)
              .map((record) => recordItem(record, context))
              .toList() +
          [moreItems(controller.records.value)]);
    }
    return [
      SettingsTile(
        title: Text(''),
      )
    ];
  }
}

class LogsTileMoreButton extends StatelessWidget {
  RecordCollection recordCollection;

  LogsTileMoreButton({
    required this.recordCollection,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCameraPopOver(context);
      },
      child: Icon(
        CupertinoIcons.ellipsis,
        color: kColourLight,
      ),
    );
  }

  void showCameraPopOver(BuildContext context) {
    showPopover(
      context: context,
      backgroundColor: kColourRightPaneBackground,
      transitionDuration: const Duration(milliseconds: 150),
      bodyBuilder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: recordCollection.imagePath != null
                ? null
                : () async {
                    await Permission.camera.status.then((value) {
                      if (value.isPermanentlyDenied) {
                        Navigator.pop(context);
                        showCameraDeniedAlertDialog(context);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context_) => CameraCamera(
                                      key: Key('cam'),
                                      resolutionPreset:
                                          ResolutionPreset.veryHigh,
                                      cameraSide: CameraSide.front,
                                      onFile: (file) {
                                        DbService db = Get.find();
                                        db.addImageToRecord(
                                            recordCollection, file.path);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    )));
                      }
                    });
                  },
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(
                  CupertinoIcons.camera,
                  size: 32,
                ),
                SizedBox(
                  width: 12,
                ),
                Text('Take Photo',
                    style: recordCollection.imagePath != null
                        ? null
                        : TextStyle(color: Colors.white))
              ],
            ),
          ),
          Container(
            width: 1,
            color: kColourTileDivider,
          ),
          CupertinoButton(
            onPressed: recordCollection.imagePath == null
                ? null
                : () {
                    DbService db = Get.find();
                    db.removeImageFromRecord(recordCollection);
                    Navigator.pop(context);
                  },
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(
                  CupertinoIcons.trash,
                  size: 32,
                ),
                SizedBox(
                  width: 12,
                ),
                Text('Delete Photo',
                    style: recordCollection.imagePath == null
                        ? null
                        : TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      direction: PopoverDirection.right,
      width: 400,
      height: 50,
      arrowHeight: 15,
      arrowWidth: 30,
    );
  }
}

void showCameraDeniedAlertDialog(BuildContext context) {
  showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoTheme(
          data: CupertinoThemeData(brightness: Brightness.dark),
          child: Container(
            color: Colors.black.withValues(alpha: 0.6),
            child: CupertinoAlertDialog(
                title: Text('Camera Access Needed'),
                content: Text(
                    'To take photos using this app, allow access to your camera in the settings app.'),
                actions: <CupertinoDialogAction>[
                  CupertinoDialogAction(
                      child: const Text(
                        'Open Settings',
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        AppSettings.openLocationSettings(asAnotherTask: true);
                      }),
                  CupertinoDialogAction(
                      child: const Text(
                        'Dismiss',
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ]),
          )));
}
