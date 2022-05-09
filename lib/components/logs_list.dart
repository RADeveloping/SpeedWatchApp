import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:collection/collection.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kColourRightPaneBackground),
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
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kColourRightPaneBackground),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          Obx(() => Text('${getInfractionCount()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold))),
                          Text(
                            'Infractions',
                            style: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              ),
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
      tiles: controller.records.isNotEmpty
          ? (controller.records
                  .take(controller.limitRecords.value)
                  .map((record) => recordItem(record))
                  .toList() +
              [moreItems()])
          : [
              SettingsTile(
                title: Text(''),
              )
            ],
    );
  }

  SettingsTile moreItems() {
    if (controller.records.length > controller.limitRecords.value) {
      return SettingsTile(
        title: Center(
            child: Text(
          'Load more',
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

  SettingsTile recordItem(RecordCollection record) {
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
      description:
          record.imagePath != null ? Image.file(File(record.imagePath!)) : null,
    );
  }

  int getInfractionCount() {
    List<RecordCollection> infractionRecords = [];
    var groupByInfractionRecords = groupBy(controller.records.value,
        (obj) => (obj as RecordCollection).speedRange);

    groupByInfractionRecords.forEach((speedRange, groupedList) {
      if (speedRange != SpeedRange.green) {
        infractionRecords += groupedList;
      }
    });
    return infractionRecords.length;
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
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context_) => CameraCamera(
                                  key: Key('cam'),
                                  resolutionPreset: ResolutionPreset.veryHigh,
                                  cameraSide: CameraSide.front,
                                  onFile: (file) {
                                    DbService db = Get.find();
                                    db.addImageToRecord(
                                        recordCollection, file.path);
                                  },
                                )));
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
                    db.addImageToRecord(recordCollection, '');
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

  void showImage(BuildContext context, File file, bool isFirstPhoto) {
    final imageProvider = Image.file(file).image;
    showImageViewer(context, imageProvider, onViewerDismissed: () {
      if (isFirstPhoto) {
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
      }
    });
  }
}
