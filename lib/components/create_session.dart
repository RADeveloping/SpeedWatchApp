import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/create_session_controller.dart';

import '../constants.dart';

class CreateSession extends GetView<CreateSessionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColourRightPaneBackground,
      appBar: AppBar(
        backgroundColor: kColourRightPaneBackground,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.delete,
            color: kColourLight,
          ),
          onPressed: () {
            // do something
          },
        ),
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
                      'Create',
                      style: kTextStyleLargeTitle,
                    ),
                  ),
                  Text(
                    'Session',
                    style: kTextStyleLargeLight,
                  ),
                ],
              ),
            ],
          ),
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
                SettingsSection(tiles: [
                  CustomSettingsTile(
                    child: SessionTextFieldEntry(
                      placeholder: 'Title',
                      onChanged: (String value) => print(value),
                      textEditingController:
                          controller.title_textController.value,
                    ),
                  ),
                  CustomSettingsTile(
                    child: SessionTextFieldEntry(
                      placeholder: 'Address',
                      onChanged: (String value) => print(value),
                      textEditingController:
                          controller.address_textController.value,
                    ),
                  ),
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Direction',
                                style: kTextStyleTileText,
                              )),
                          Obx(() => ChipsChoice<String>.multiple(
                                value: controller.directionTags.value,
                                onChanged: (val) {
                                  if (val.length > 2) {
                                    val.removeAt(val.length - 2);
                                    controller.directionTags.value = val;
                                  } else {
                                    controller.directionTags.value = val;
                                  }
                                },
                                choiceItems: C2Choice.listFrom<String, String>(
                                  source: controller.directionOptions,
                                  value: (i, v) => v,
                                  label: (i, v) => v,
                                ),
                                choiceActiveStyle: C2ChoiceStyle(
                                  backgroundColor: kColourLight,
                                  padding: EdgeInsets.all(10.0),
                                  color: Colors.white,
                                  borderColor: Colors.transparent,
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                choiceStyle: C2ChoiceStyle(
                                  color: Colors.white,
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  backgroundColor: kColourSidebarTile,
                                  borderColor: kColourLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                runSpacing: 20,
                              ))
                        ],
                      )
                    ],
                  )),
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Start',
                                style: kTextStyleTileText,
                              )),
                          Obx(() => ChipsChoice<String>.multiple(
                                value: controller.startTags.value,
                                onChanged: (val) {
                                  controller.startTags.value = val;
                                },
                                choiceItems: C2Choice.listFrom<String, String>(
                                  source: controller.startOptions,
                                  value: (i, v) => v,
                                  label: (i, v) => v,
                                ),
                                choiceActiveStyle: C2ChoiceStyle(
                                  backgroundColor: kColourLight,
                                  padding: EdgeInsets.all(10.0),
                                  color: Colors.white,
                                  borderColor: Colors.transparent,
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                choiceStyle: C2ChoiceStyle(
                                  color: Colors.white,
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  backgroundColor: kColourSidebarTile,
                                  borderColor: kColourLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                runSpacing: 20,
                              ))
                        ],
                      )
                    ],
                  )),
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'End',
                                style: kTextStyleTileText,
                              )),
                          Obx(() => ChipsChoice<String>.multiple(
                                value: controller.endTags.value,
                                onChanged: (val) {
                                  controller.endTags.value = val;
                                },
                                choiceItems: C2Choice.listFrom<String, String>(
                                  source: controller.endOptions,
                                  value: (i, v) => v,
                                  label: (i, v) => v,
                                ),
                                choiceActiveStyle: C2ChoiceStyle(
                                  backgroundColor: kColourLight,
                                  padding: EdgeInsets.all(10.0),
                                  color: Colors.white,
                                  borderColor: Colors.transparent,
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                choiceStyle: C2ChoiceStyle(
                                  color: Colors.white,
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  backgroundColor: kColourSidebarTile,
                                  borderColor: kColourLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                runSpacing: 20,
                              ))
                        ],
                      )
                    ],
                  )),
                ]),
                CustomSettingsSection(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomSettingsTile(
                      child: Column(
                        children: [
                          Obx(
                            () => CupertinoSearchTextField(
                              controller:
                                  controller.volunteer_textController.value,
                              itemColor: kColourLight,
                              placeholder: 'Search Volunteers',
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
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(9.0),
                                  topRight: Radius.circular(9.0)),
                              onSuffixTap: () {
                                controller.volunteer_textController.value
                                    .clear();
                              },
                            ),
                          ),
                          Container(
                            height: 1,
                            color: kColourTileDivider,
                          ),
                          CustomSettingsTile(
                              child: Stack(
                            fit: StackFit.passthrough,
                            alignment: Alignment.center,
                            children: [
                              CustomSettingsTile(
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: kColourSidebarTile,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(9.0),
                                          bottomRight: Radius.circular(9.0))),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Obx(() =>
                                        ChipsChoice<String>.multiple(
                                          value: controller.volunteerTags.value,
                                          onChanged: (val) {
                                            controller.volunteerTags.value =
                                                val;
                                          },
                                          runSpacing: 20,
                                          choiceItems:
                                              C2Choice.listFrom<String, String>(
                                            source: controller.volunteerOptions,
                                            value: (i, v) => v,
                                            label: (i, v) => v,
                                          ),
                                          choiceActiveStyle: C2ChoiceStyle(
                                            backgroundColor: kColourLight,
                                            padding: EdgeInsets.all(10.0),
                                            color: Colors.white,
                                            borderColor: Colors.transparent,
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          choiceStyle: C2ChoiceStyle(
                                            color: Colors.white,
                                            labelStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                            padding: EdgeInsets.all(10.0),
                                            backgroundColor: kColourSidebarTile,
                                            borderColor: kColourLight,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      width: 1,
                                      height: 80,
                                      color: kColourTileDivider,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        FaIcon(
                                          CupertinoIcons.add_circled,
                                          color: kColourLight,
                                          size: 40,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Add Volunterr',
                                          style: kTextStyleTileText,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                SettingsSection(tiles: [
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Road Zone',
                                style: kTextStyleTileText,
                              )),
                          Expanded(
                            child: Obx(() => ChipsChoice<String>.multiple(
                                  value: controller.roadZoneTags.value,
                                  onChanged: (val) {
                                    if (val.length > 1) {
                                      val.removeAt(val.length - 2);
                                      controller.roadZoneTags.value = val;
                                    } else {
                                      controller.roadZoneTags.value = val;
                                    }
                                  },
                                  choiceItems:
                                      C2Choice.listFrom<String, String>(
                                    source: controller.roadZoneOptions,
                                    value: (i, v) => v,
                                    label: (i, v) => v,
                                  ),
                                  choiceActiveStyle: C2ChoiceStyle(
                                    backgroundColor: kColourLight,
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.white,
                                    borderColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  choiceStyle: C2ChoiceStyle(
                                    color: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    backgroundColor: kColourSidebarTile,
                                    borderColor: kColourLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  runSpacing: 20,
                                )),
                          )
                        ],
                      )
                    ],
                  )),
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Speed Limit ( km/h )',
                                style: kTextStyleTileText,
                              )),
                          Expanded(
                            child: Obx(() => ChipsChoice<String>.multiple(
                                  value: controller.speedLimitTags.value,
                                  onChanged: (val) {
                                    if (val.length > 1) {
                                      val.removeAt(val.length - 2);
                                      controller.speedLimitTags.value = val;
                                    } else {
                                      controller.speedLimitTags.value = val;
                                    }
                                  },
                                  choiceItems:
                                      C2Choice.listFrom<String, String>(
                                    source: controller.speedLimitOptions,
                                    value: (i, v) => v,
                                    label: (i, v) => v,
                                  ),
                                  choiceActiveStyle: C2ChoiceStyle(
                                    backgroundColor: kColourLight,
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.white,
                                    borderColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  choiceStyle: C2ChoiceStyle(
                                    color: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    backgroundColor: kColourSidebarTile,
                                    borderColor: kColourLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  runSpacing: 20,
                                )),
                          )
                        ],
                      )
                    ],
                  )),
                  CustomSettingsTile(
                      child: Obx(() =>
                          (controller.speedLimitTags.value.length > 0) &&
                                  controller.speedLimitTags.value[0] == 'Other'
                              ? CustomSettingsTile(
                                  child: SessionTextFieldEntry(
                                    placeholder: 'Other Speed Limit ( km/h )',
                                    onChanged: (String value) => print(value),
                                    textEditingController:
                                        controller.speed_textController.value,
                                  ),
                                )
                              : Container())),
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Weather Conditions',
                                style: kTextStyleTileText,
                              )),
                          Expanded(
                            child: Obx(() => ChipsChoice<String>.multiple(
                                  value: controller.weatherTags.value,
                                  onChanged: (val) {
                                    if (val.length > 1) {
                                      val.removeAt(val.length - 2);
                                      controller.weatherTags.value = val;
                                    } else {
                                      controller.weatherTags.value = val;
                                    }
                                  },
                                  choiceItems:
                                      C2Choice.listFrom<String, String>(
                                    source: controller.weatherOptions,
                                    value: (i, v) => v,
                                    label: (i, v) => v,
                                  ),
                                  choiceActiveStyle: C2ChoiceStyle(
                                    backgroundColor: kColourLight,
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.white,
                                    borderColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  choiceStyle: C2ChoiceStyle(
                                    color: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    backgroundColor: kColourSidebarTile,
                                    borderColor: kColourLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  runSpacing: 20,
                                )),
                          )
                        ],
                      )
                    ],
                  )),
                  CustomSettingsTile(
                      child: Obx(() =>
                          (controller.weatherTags.value.length > 0) &&
                                  controller.weatherTags.value[0] == 'Other'
                              ? CustomSettingsTile(
                                  child: SessionTextFieldEntry(
                                    placeholder: 'Other Weather Conditions',
                                    onChanged: (String value) => print(value),
                                    textEditingController:
                                        controller.weather_textController.value,
                                  ),
                                )
                              : Container())),
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Road Conditions',
                                style: kTextStyleTileText,
                              )),
                          Expanded(
                            child: Obx(() => ChipsChoice<String>.multiple(
                                  value: controller.roadConditionTags.value,
                                  onChanged: (val) {
                                    if (val.length > 1) {
                                      val.removeAt(val.length - 2);
                                      controller.roadConditionTags.value = val;
                                    } else {
                                      controller.roadConditionTags.value = val;
                                    }
                                  },
                                  choiceItems:
                                      C2Choice.listFrom<String, String>(
                                    source: controller.roadConditionOptions,
                                    value: (i, v) => v,
                                    label: (i, v) => v,
                                  ),
                                  choiceActiveStyle: C2ChoiceStyle(
                                    backgroundColor: kColourLight,
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.white,
                                    borderColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  choiceStyle: C2ChoiceStyle(
                                    color: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    backgroundColor: kColourSidebarTile,
                                    borderColor: kColourLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  runSpacing: 20,
                                )),
                          )
                        ],
                      )
                    ],
                  )),
                  CustomSettingsTile(
                      child: Obx(() =>
                          (controller.roadConditionTags.value.length > 0) &&
                                  controller.roadConditionTags.value[0] ==
                                      'Other'
                              ? CustomSettingsTile(
                                  child: SessionTextFieldEntry(
                                    placeholder: 'Other Road Conditions',
                                    onChanged: (String value) => print(value),
                                    textEditingController: controller
                                        .road_conditions_textController.value,
                                  ),
                                )
                              : Container())),
                  CustomSettingsTile(
                      child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: CustomSettingsTile(
                          child: Container(
                            height: 66,
                            decoration: BoxDecoration(
                                color: kColourSidebarTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Visibility',
                                style: kTextStyleTileText,
                              )),
                          Expanded(
                            child: Obx(() => ChipsChoice<String>.multiple(
                                  value: controller.roadVisibilityTags.value,
                                  onChanged: (val) {
                                    if (val.length > 1) {
                                      val.removeAt(val.length - 2);
                                      controller.roadVisibilityTags.value = val;
                                    } else {
                                      controller.roadVisibilityTags.value = val;
                                    }
                                  },
                                  choiceItems:
                                      C2Choice.listFrom<String, String>(
                                    source: controller.roadVisibilityOptions,
                                    value: (i, v) => v,
                                    label: (i, v) => v,
                                  ),
                                  choiceActiveStyle: C2ChoiceStyle(
                                    backgroundColor: kColourLight,
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.white,
                                    borderColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  choiceStyle: C2ChoiceStyle(
                                    color: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    backgroundColor: kColourSidebarTile,
                                    borderColor: kColourLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  runSpacing: 20,
                                )),
                          )
                        ],
                      )
                    ],
                  )),
                  CustomSettingsTile(
                      child: Obx(() =>
                          (controller.roadVisibilityTags.value.length > 0) &&
                                  controller.roadVisibilityTags.value[0] ==
                                      'Other'
                              ? CustomSettingsTile(
                                  child: SessionTextFieldEntry(
                                    placeholder: 'Other Road Visibility',
                                    onChanged: (String value) => print(value),
                                    textEditingController: controller
                                        .road_conditions_textController.value,
                                  ),
                                )
                              : Container())),
                ]),
                SettingsSection(tiles: [
                  CustomSettingsTile(
                    child: Container(
                      height: 66,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: FaIcon(CupertinoIcons.add),
                            label: Text('Create Session'),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kColourLight)),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SessionTextFieldEntry extends GetView<CreateSessionController> {
  final placeholder;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextEditingController textEditingController;
  final bool onlyTopRadius = false;
  final bool onlyBottomRadius = false;

  SessionTextFieldEntry({
    Key? key,
    required this.placeholder,
    required this.textEditingController,
    this.onSubmitted,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: CupertinoTextField(
        controller: textEditingController,
        cursorColor: kColourLight,
        decoration: BoxDecoration(
            color: kColourSidebarTile,
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        keyboardAppearance: Brightness.dark,
        padding: EdgeInsets.all(23),
        placeholder: placeholder,
        placeholderStyle: kTextStyleTilePlaceholder,
        textCapitalization: TextCapitalization.sentences,
        style: kTextStyleTileText,
        suffix: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FaIcon(
            CupertinoIcons.clear_circled_solid,
            color: kColourSuffixIcon,
            size: 20,
          ),
        ),
        suffixMode: OverlayVisibilityMode.editing,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        onTap: () {
          textEditingController.clear();
        },
      ),
    );
  }
}
