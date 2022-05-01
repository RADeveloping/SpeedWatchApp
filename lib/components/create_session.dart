import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/create_session_controller.dart';

import '../constants.dart';

class CreateSession extends GetView<CreateSessionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColourSidebarBackground,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SettingsList(
              applicationType: ApplicationType.both,
              brightness: Brightness.light,
              lightTheme: SettingsThemeData(
                settingsListBackground: kColourSidebarBackground,
                settingsSectionBackground: kColourSidebarTile,
                settingsTileTextColor: kColourSidebarTileText,
                dividerColor: kColourTileDivider,
              ),
              sections: [
                SettingsSection(
                  title: Text('FRIDAY, APRIL 29, 2022'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      title: Text(
                        '784 Robson St',
                        style: kTextStyleSidebarTile,
                      ),
                      value: Text('758'),
                    ),
                    SettingsTile.navigation(
                      title: Text(
                        '4051 Tanner Street',
                        style: kTextStyleSidebarTile,
                      ),
                      value: Text('913'),
                    ),
                    SettingsTile.navigation(
                      title: Text(
                        '1967 Robson St',
                        style: kTextStyleSidebarTile,
                      ),
                      value: Text('857'),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text('THURSDAY, APRIL 28, 2022'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      title: Text(
                        '164 Dunsmuir',
                        style: kTextStyleSidebarTile,
                      ),
                      value: Text('1640'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
