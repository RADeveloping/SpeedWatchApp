import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import '../constants.dart';
import 'package:share_plus/share_plus.dart';

class LogsList extends GetView<SidebarController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SettingsList(
            applicationType: ApplicationType.both,
            brightness: Brightness.light,
            lightTheme: SettingsThemeData(
              settingsListBackground: kColourSidebarBackground,
              settingsSectionBackground: Colors.transparent,
              settingsTileTextColor: kColourSidebarTileText,
              tileHighlightColor: kColourLight,
              dividerColor: kColourTileDivider,
            ),
            sections: [
              SettingsSection(
                title: Text(controller.currentSessionDate.value),
                margin: EdgeInsetsDirectional.zero,
                tiles: <SettingsTile>[
                  SettingsTile(
                    trailing: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '0-50 km/h',
                            style: TextStyle(color: kColourPlaceHolderText),
                          ),
                        ),
                        LogsTileMoreButton(),
                      ],
                    ),
                    leading: Icon(
                      Icons.motorcycle,
                      color: Colors.white,
                    ),
                    title: Column(
                      children: [
                        Text(
                          '10:32:38 AM',
                          style: kTextStyleSidebarTile,
                        ),
                        Text(
                          'Motor Bike',
                          style: kTextStyleTilePlaceholder,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  SettingsTile.navigation(
                    trailing: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '0-50 km/h',
                            style: TextStyle(color: kColourPlaceHolderText),
                          ),
                        ),
                        LogsTileMoreButton(),
                      ],
                    ),
                    leading: Icon(
                      Icons.directions_car,
                      color: Colors.white,
                    ),
                    title: Column(
                      children: [
                        Text(
                          '10:31:15 AM',
                          style: kTextStyleSidebarTile,
                        ),
                        Text(
                          'Passenger',
                          style: kTextStyleTilePlaceholder,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  SettingsTile.navigation(
                    trailing: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '0-50 km/h',
                            style: TextStyle(color: kColourPlaceHolderText),
                          ),
                        ),
                        LogsTileMoreButton(),
                      ],
                    ),
                    leading: Icon(
                      Icons.directions_bus,
                      color: Colors.white,
                    ),
                    title: Column(
                      children: [
                        Text(
                          '10:30:38 AM',
                          style: kTextStyleSidebarTile,
                        ),
                        Text(
                          'Transit',
                          style: kTextStyleTilePlaceholder,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  SettingsTile.navigation(
                    trailing: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '0-50 km/h',
                            style: TextStyle(color: kColourPlaceHolderText),
                          ),
                        ),
                        LogsTileMoreButton(),
                      ],
                    ),
                    leading: Icon(
                      Icons.local_shipping,
                      color: Colors.white,
                    ),
                    title: Column(
                      children: [
                        Text(
                          '10:30:03 AM',
                          style: kTextStyleSidebarTile,
                        ),
                        Text(
                          'Large Truck',
                          style: kTextStyleTilePlaceholder,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
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
