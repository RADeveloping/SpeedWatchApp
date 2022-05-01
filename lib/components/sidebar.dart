import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

class Sidebar extends GetView<SidebarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColourSidebarBackground,
      appBar: AppBar(
        backgroundColor: kColourSidebarBackground,
        shadowColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              CupertinoIcons.share_up,
              color: kColourLight,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sessions',
                      style: kTextStyleLargeTitle,
                    ),
                  ),
                ],
              ),
              Container(
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
                            fontFamily: 'Arial',
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
            ],
          ),
          Obx(
            () => controller.archiveExpanded.value
                ? Container()
                : Expanded(
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
          ),
          SizedBox(
            height: 1,
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                controller.archiveExpanded.value =
                    !controller.archiveExpanded.value;
              },
              child: Container(
                color: kColourSidebarTile,
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Archived',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Obx(() => Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: FaIcon(
                            controller.archiveExpanded.value
                                ? CupertinoIcons.chevron_right
                                : CupertinoIcons.chevron_down,
                            color: kColourLight,
                            size: 18 * MediaQuery.of(context).textScaleFactor,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => controller.archiveExpanded.value
                ? Expanded(
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
                          title: Text('TUE, MARCH 8, 2022'),
                          tiles: <SettingsTile>[
                            SettingsTile.navigation(
                              title: Text(
                                '4747 Kingsway',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('2934'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '3500 Cambie Street',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('1508'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '3646 Nootka Street',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('759'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '310 Hastings Street',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('887'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '3836 Robson St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('546'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '418 Robson St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('44'),
                            ),
                            SettingsTile.navigation(
                              title: Text(
                                '2700 Tolmie St',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('567'),
                            ),
                          ],
                        ),
                        SettingsSection(
                          title: Text('SAT, AUGUST 28, 2021'),
                          tiles: <SettingsTile>[
                            SettingsTile.navigation(
                              title: Text(
                                '164 Dunsmuir',
                                style: kTextStyleSidebarTile,
                              ),
                              value: Text('1600'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
