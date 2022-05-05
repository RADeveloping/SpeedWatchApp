import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:popover/popover.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/collections/session.dart';
import 'package:speedwatch/components/rightpane.dart';
import 'package:speedwatch/components/text_field_input.dart';
import 'package:speedwatch/controllers/session_controller.dart';
import 'package:speedwatch/controllers/create_session_controller.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/enums/direction.dart';
import 'package:speedwatch/enums/road_condition.dart';
import 'package:speedwatch/enums/road_lighting.dart';
import 'package:speedwatch/enums/road_zone.dart';
import 'package:speedwatch/enums/weather.dart';

import '../constants.dart';
import 'cupertino_page_scaffold_custom.dart';
import '../enums/speed_range.dart';
import '../services/db_service.dart';
import 'custom_tile_with_choices.dart';
import 'date_time_picker.dart';

class Session extends GetView<SessionController> {
  late DatePickerChoice startDatePicker;
  late DatePickerChoice endDatePicker;

  String title;
  String submitButtonText;

  Session({required this.title, required this.submitButtonText});

  @override
  Widget build(BuildContext context) {
    startDatePicker = DatePickerChoice(
        dateTime: DateTime.now(),
        onChange: (dateTime) {
          endDatePicker.date.value = dateTime.add(Duration(hours: 1));
        });
    endDatePicker = DatePickerChoice(
        dateTime: DateTime.now().add(Duration(hours: 1)),
        minDate: startDatePicker.date.value);
    return CupertinoPageScaffoldCustom(
      backgroundColor: kColourRightPaneBackground,
      leading: DiscardSessionChangesButton(),
      largeTitle: title,
      heroTag: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Expanded(
              child: SettingsList(
                applicationType: ApplicationType.both,
                brightness: Brightness.light,
                lightTheme: SettingsThemeData(
                  settingsListBackground: kColourRightPaneBackground,
                  settingsSectionBackground: kColourSidebarTile,
                  settingsTileTextColor: kColourSidebarTileText,
                  tileHighlightColor: kColourLight,
                  dividerColor: kColourTileDivider,
                ),
                sections: [
                  SettingsSection(tiles: [
                    SettingsTile(
                      title: SessionTextFieldEntry(
                        placeholder: 'Address',
                        onChanged: (String value) => print(value),
                        textEditingController:
                            controller.address_textController.value,
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    CustomSettingsTile(
                        child: CustomTileWithChoices(
                      leadingText: 'Direction',
                      tileTag: controller.directionTag,
                      tileOptions: controller.directionOptions,
                    )),
                    CustomSettingsTile(
                      child: CustomTileWithChoices(
                        leadingText: 'Start',
                        tileTag: controller.directionTag,
                        tileOptions: controller.directionOptions,
                        trailing: startDatePicker,
                      ),
                    ),
                    CustomSettingsTile(
                        child: CustomTileWithChoices(
                      leadingText: 'End',
                      tileTag: controller.directionTag,
                      tileOptions: controller.directionOptions,
                      trailing: endDatePicker,
                    )),
                  ]),
                  SettingsSection(tiles: [
                    SettingsTile(
                      title: Obx(
                        () => CupertinoTheme(
                            data:
                                CupertinoThemeData(brightness: Brightness.dark),
                            child: CupertinoSearchTextField(
                              backgroundColor: Colors.transparent,
                              controller:
                                  controller.volunteer_textController.value,
                              itemColor: kColourLight,
                              placeholder: 'Search Volunteers',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              onChanged: (String value) {
                                controller.volunteerSearchValueChanged(value);
                              },
                              onSubmitted: (String value) {
                                controller.volunteerSearchValueChanged(value);
                              },
                              onSuffixTap: () {
                                controller.volunteer_textController.value
                                    .clear();
                                controller.volunteerSearchValueChanged('');
                              },
                            )),
                      ),
                    ),
                    SettingsTile(
                        title: Obx(() => Material(
                              color: Colors.transparent,
                              child: ChipsChoice<String>.multiple(
                                value: controller.volunteerTags.value,
                                onChanged: (val) {
                                  controller.volunteerTags.value = val;
                                  controller.mockUserListFromDatabase
                                      .addAll(val);
                                },
                                runSpacing: 20,
                                choiceItems: C2Choice.listFrom<String, String>(
                                  source: controller.volunteerOptions,
                                  value: (i, v) => v,
                                  label: (i, v) => v,
                                ),
                                choiceActiveStyle: choiceActiveStyle,
                                choiceStyle: choiceStyle,
                              ),
                            )))
                  ]),
                  SettingsSection(tiles: [
                    CustomSettingsTile(
                        child: CustomTileWithChoices(
                      leadingText: 'Road Zone',
                      tileTag: controller.roadZoneTag,
                      tileOptions: controller.roadZoneOptions,
                    )),
                    CustomSettingsTile(
                        child: CustomTileWithChoices(
                      leadingText: 'Speed Limit (km/h)',
                      tileTag: controller.speedLimitTag,
                      tileOptions: controller.speedLimitOptions,
                    )),
                    CustomSettingsTile(
                        child: CustomTileWithChoices(
                      leadingText: 'Weather Conditions',
                      tileTag: controller.weatherTag,
                      tileOptions: controller.weatherOptions,
                    )),
                    CustomSettingsTile(
                        child: CustomTileWithChoices(
                      leadingText: 'Road Conditions',
                      tileTag: controller.roadConditionTag,
                      tileOptions: controller.roadLightingOptions,
                    )),
                    CustomSettingsTile(
                        child: CustomTileWithChoices(
                      leadingText: 'Lighting',
                      tileTag: controller.roadLightingTag,
                      tileOptions: controller.roadLightingOptions,
                    )),
                  ]),
                  SettingsSection(tiles: [
                    CustomSettingsTile(
                        child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          async {
                            Isar db = Get.find();
                            await db.writeTxn(((isar) async {
                              await db.sessions.put(controller.getSession());
                            }));
                          }
                        },
                        icon: FaIcon(CupertinoIcons.add),
                        label: Text(submitButtonText),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kColourLight)),
                      ),
                    ))
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscardSessionChangesButton extends GetView<SessionController> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Icon(
        CupertinoIcons.xmark,
        color: kColourLight,
      ),
      onPressed: () {
        showPopover(
          context: context,
          backgroundColor: kColourRightPaneBackground,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (context) => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Are you sure you want to discard changes?',
                    style: TextStyle(fontSize: 14, color: Colors.white24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: 1,
                color: kColourTileDivider,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Discard Changes',
                      style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.offAndToNamed('/home');
                },
              ),
            ],
          ),
          direction: PopoverDirection.bottom,
          width: 300,
          height: 125,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
    );
  }
}
