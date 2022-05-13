import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/collections/session_collection.dart';
import 'package:speedwatch/components/session_detail.dart';
import 'package:speedwatch/components/text_field_input.dart';
import 'package:speedwatch/controllers/home_controller.dart';
import 'package:speedwatch/controllers/session_controller.dart';

import '../collections/settings_collection.dart';
import '../constants.dart';
import '../controllers/sidebar_controller.dart';
import '../services/db_service.dart';
import 'custom_tile_with_choices.dart';
import 'date_time_picker.dart';
import 'navigation_bar.dart';

class Session extends GetView<SessionController> {
  late DatePickerChoice startDatePicker;
  late DatePickerChoice endDatePicker;

  String title;
  String submitButtonText;

  Session({required this.title, required this.submitButtonText}) {
    if (Get.currentRoute.isCaseInsensitiveContains('edit')) {
      controller.existingCollection.value.clear();
      controller.existingCollection.value.add(Get.arguments);
      controller.setEditSessionDetails(Get.arguments);
    } else {
      controller.existingCollection.value.clear();
      controller.resetSessionDetails();
    }
  }
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    SidebarController s = Get.find();
    controller.setVolunteerOptions();
    startDatePicker = DatePickerChoice(
        dateTime: Get.arguments == null
            ? DateTime.now()
            : controller.startEditDate.value,
        onChange: (dateTime) {
          if (Get.arguments == null) {
            endDatePicker.date.value = dateTime.add(Duration(hours: 2));
          }
          endDatePicker.minDate = dateTime.add(Duration(minutes: 1));
        },
        minDate: Get.arguments == null ? null : controller.startEditDate.value);
    endDatePicker = DatePickerChoice(
        dateTime: Get.arguments == null
            ? DateTime.now().add(Duration(hours: 2))
            : controller.endEditDate.value,
        minDate: Get.arguments == null
            ? startDatePicker.date.value
            : controller.startEditDate.value);

    return NavigationBarCustom(
      outerContext: context,
      largeTitle: Get.arguments == null ? 'Create Session' : 'Edit Session',
      child: Obx(
        () => SettingsList(
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
                textEditingController: controller.address_textController.value,
                onChanged: (String value) {
                  controller.address.value = value;
                },
                onTap: () {
                  controller.address.value = '';
                },
                keyboardType: TextInputType.streetAddress,
              )),
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
            SettingsSection(
              tiles: [
                SettingsTile(
                  title: Obx(
                    () => CupertinoTheme(
                        data: CupertinoThemeData(brightness: Brightness.dark),
                        child: SessionTextFieldEntry(
                          onTap: () {
                            controller.volunteerSearchValueChanged('');
                          },
                          onChanged: (String value) {
                            controller
                                .volunteerSearchValueChanged(value.trim());
                          },
                          onSubmitted: (String value) {
                            controller
                                .volunteerSearchValueChanged(value.trim());
                          },
                          keyboardType: TextInputType.name,
                          textEditingController:
                              controller.volunteer_textController.value,
                          placeholder: 'Volunteer Name',
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
                              controller.userListFromDatabase.addAll(val);
                              controller.volunteer_textController.value.clear();
                              controller.volunteerSearchValueChanged('');
                            },
                            placeholderBuilder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: Text(
                                    'No Saved Volunteers',
                                    style: TextStyle(
                                        color: kColourPlaceHolderText,
                                        fontSize: 16),
                                  ),
                                ),
                              );
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
              ],
              margin: EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 16.0, 10.0),
            ),
            SettingsSection(tiles: [
              CustomSettingsTile(
                  child: CustomTileWithChoices(
                leadingText: 'Road Zone',
                tileTag: controller.roadZoneTag,
                tileOptions: controller.roadZoneOptions,
              )),
              CustomSettingsTile(
                  child: Get.arguments == null || s.records.length == 0
                      ? CustomTileWithChoices(
                          leadingText: 'Speed Limit (km/h)',
                          tileTag: controller.speedLimitTag,
                          tileOptions: controller.speedLimitOptions,
                        )
                      : Container()),
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
                tileOptions: controller.roadConditionOptions,
              )),
              CustomSettingsTile(
                  child: CustomTileWithChoices(
                leadingText: 'Lighting',
                tileTag: controller.roadLightingTag,
                tileOptions: controller.roadLightingOptions,
              )),
            ]),
            SettingsSection(tiles: [
              SettingsTile(
                title: Obx(
                  () => CupertinoTheme(
                      data: CupertinoThemeData(brightness: Brightness.dark),
                      child: SessionTextFieldEntry(
                        keyboardType: TextInputType.multiline,
                        textEditingController:
                            controller.notes_textController.value,
                        placeholder: 'Session Notes',
                      )),
                ),
              ),
            ]),
            SettingsSection(tiles: [
              CustomSettingsTile(
                child: Center(
                    child: CupertinoTheme(
                  child: CupertinoButton.filled(
                    onPressed: controller.address.value.isEmpty ||
                            controller.volunteerTags.value.isEmpty
                        ? null
                        : controller.existingCollection.isEmpty
                            ? createNewSessionClick
                            : updateSessionClick,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.add),
                        SizedBox(
                          width: 8,
                        ),
                        Text(submitButtonText)
                      ],
                    ),
                  ),
                  data: CupertinoThemeData(
                      brightness: Brightness.dark, primaryColor: kColourLight),
                )),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  void createNewSessionClick() async {
    DbService dbService = Get.find();
    SidebarController s = Get.find();
    SessionDetailDetailController sessionDetailController = Get.find();
    sessionDetailController.sliding.value = 0;
    SessionCollection newSessionCollection = controller.getSession(
        startDatePicker.date.value, endDatePicker.date.value);
    SettingsCollection newSettingsCollection = SettingsCollection()
      ..id = 0
      ..value = await controller.getNewVolunteerNamesValue()
      ..key = 'names';

    int id = await dbService.writeSessionToDB(
        newSessionCollection, newSettingsCollection);
    s.records.value = [];
    s.currentSession.value = newSessionCollection;
    s.isSessionCompleted.value =
        !DateTime.now().isBefore(s.currentSession.value.endTime);

    Get.offAndToNamed('/Logs/${id}');
  }

  void updateSessionClick() async {
    DbService dbService = Get.find();
    SidebarController s = Get.find();
    SessionDetailDetailController sessionDetailController = Get.find();
    sessionDetailController.sliding.value = 0;
    SessionCollection updatedSessionCollection = controller.updateSession(
        startDatePicker.date.value,
        endDatePicker.date.value,
        s.currentSession.value);
    SettingsCollection newSettingsCollection = SettingsCollection()
      ..id = 0
      ..value = await controller.getNewVolunteerNamesValue()
      ..key = 'names';

    await dbService.writeSessionToDB(
        updatedSessionCollection, newSettingsCollection);
    s.currentSession.value = updatedSessionCollection;
    s.isSessionCompleted.value =
        !DateTime.now().isBefore(s.currentSession.value.endTime);
    s.currentSession.refresh();

    Get.back();
  }
}
