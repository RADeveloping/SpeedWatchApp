import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:popover/popover.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import '../collections/record_collection.dart';
import '../constants.dart';
import 'package:collection/collection.dart';
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Obx(() => Text(
                          'Total: ${controller.records.value.length}',
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Obx(() => Text(
                        'Infractions: ${getInfractionCount()}',
                        style: TextStyle(color: Colors.white))),
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
                          color: Colors.white, fontWeight: FontWeight.w100),
                    ),
                    Text(
                      '${DateFormat('M/d/y h:mm aa').format(controller.currentSession.value.startTime).toUpperCase()} - ${DateFormat('M/d/y h:mm aa').format(controller.currentSession.value.endTime).toUpperCase()}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w100),
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
          LogsTileMoreButton(),
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
  const LogsTileMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          context: context,
          backgroundColor: kColourRightPaneBackground,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CameraCamera(
                                cameraSide: CameraSide.front,
                                onFile: (file) {
                                  print(file);
                                  Navigator.pop(context);
                                },
                              )));
                },
                padding: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(
                      CupertinoIcons.camera,
                      size: 32,
                      color: kColourLight,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Take Photo')
                  ],
                ),
              ),
              Container(
                width: 1,
                color: kColourTileDivider,
              ),
              CupertinoButton(
                onPressed: null,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(
                      CupertinoIcons.photo,
                      size: 32,
                      // TODO UPDATE DISABLED COLOUR
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('View Photo')
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
      },
      child: Icon(
        CupertinoIcons.ellipsis,
        color: kColourLight,
      ),
    );
  }
}
