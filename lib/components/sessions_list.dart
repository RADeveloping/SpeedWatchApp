import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import '../constants.dart';

class SessionsList extends GetView<SidebarController> {
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
              settingsSectionBackground: kColourSidebarTile,
              settingsTileTextColor: kColourSidebarTileText,
              tileHighlightColor: kColourLight,
              dividerColor: kColourTileDivider,
            ),
            sections: [
              CustomSettingsSection(
                child: Container(
                  margin: EdgeInsetsDirectional.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CupertinoSearchTextField(
                            controller: controller.textController.value,
                            itemColor: kColourLight,
                            placeholder: 'Search Sessions',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            prefixInsets: EdgeInsets.all(10),
                            onChanged: (String value) {
                              print('The text has changed to: $value');
                            },
                            onSubmitted: (String value) {
                              print('Submitted text: $value');
                            },
                            onSuffixTap: () {
                              controller.textController.value.clear();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SettingsSection(
                title: Text('FRIDAY, APRIL 29, 2022'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    title: Text(
                      '784 Robson St',
                      style: kTextStyleSidebarTile,
                    ),
                    value: Text('758'),
                    onPressed: (BuildContext context) {
                      Get.toNamed('/session/445');
                    },
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
              CustomSettingsSection(
                child: CustomSettingsTile(
                  child: GestureDetector(
                    onTap: () => controller.archiveExpanded.value =
                        !controller.archiveExpanded.value,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: FaIcon(
                                  CupertinoIcons.archivebox,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              Text(
                                'Archived',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Obx(() => Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: FaIcon(
                                  controller.archiveExpanded.value
                                      ? CupertinoIcons.chevron_right
                                      : CupertinoIcons.chevron_down,
                                  color: kColourLight,
                                  size: 18 *
                                      MediaQuery.of(context).textScaleFactor,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CustomSettingsSection(
                  child: Obx(() => controller.archiveExpanded.value
                      ? SettingsSection(
                          title: Text('FRIDAY, JANUARY 4, 2021'),
                          tiles: <SettingsTile>[
                            SettingsTile.navigation(
                              title: Text(
                                '985 Alberni St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('599'),
                              onPressed: (BuildContext context) {},
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                'W47 and 16TH',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('1452'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '1967 Robson St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('567'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '985 Alberni St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('599'),
                              onPressed: (BuildContext context) {},
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                'W47 and 16TH',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('1452'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '1967 Robson St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('567'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '985 Alberni St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('599'),
                              onPressed: (BuildContext context) {},
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                'W47 and 16TH',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('1452'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '1967 Robson St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('567'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '985 Alberni St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('599'),
                              onPressed: (BuildContext context) {},
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                'W47 and 16TH',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('1452'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '1967 Robson St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('567'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '985 Alberni St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('599'),
                              onPressed: (BuildContext context) {},
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                'W47 and 16TH',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('1452'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '1967 Robson St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('567'),
                            ),
                          ],
                        )
                      : Container()))
            ],
          ),
        ),
      ],
    );
  }
}
