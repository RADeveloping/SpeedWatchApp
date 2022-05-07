import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:popover/popover.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/enums/vehicle_type.dart';
import '../collections/record_collection.dart';
import '../constants.dart';
import 'package:collection/collection.dart';
import 'package:share_plus/share_plus.dart';

import '../enums/speed_range.dart';

class LogsList extends GetView<SidebarController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
      ],
    );
  }

  AbstractSettingsSection buildSection(BuildContext context) {
    return SettingsSection(
      title: Text(controller.currentSession.value.streetAddress
          + '\n' + DateFormat('EEEEEE, MMMM dd, y h:mm a')
              .format(controller.currentSession.value.startTime).toUpperCase()
          +  '\nTotal: ${controller.records.value.length} '
          'Infractions: ${getInfractionCount()} \n'
          ),
      margin: EdgeInsetsDirectional.zero,
      tiles: controller.records.isNotEmpty ? controller.records.map((record) => recordItem(record)).toList() 
      : [SettingsTile(title: Text(''),)],
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
    var groupByInfractionRecords = groupBy(
        controller.records.value,
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
                                  //When take foto you should close camera
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
