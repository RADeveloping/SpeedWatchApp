import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/create_session_controller.dart';
import 'package:popover/popover.dart';
import 'package:intl/intl.dart';

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
            CupertinoIcons.xmark,
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
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Direction',
                          style: kTextStyleTileText,
                        ),
                      ),
                      trailing: Obx(() => ChipsChoice<String>.multiple(
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
                          )),
                    ),
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Start',
                          style: kTextStyleTileText,
                        ),
                      ),
                      trailing: DateTimePicker(
                        isStart: true,
                      ),
                    ),
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'End',
                          style: kTextStyleTileText,
                        ),
                      ),
                      trailing: DateTimePicker(
                        isStart: false,
                      ),
                    ),
                  ]),
                  CustomSettingsSection(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 32),
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
                                            value:
                                                controller.volunteerTags.value,
                                            onChanged: (val) {
                                              controller.volunteerTags.value =
                                                  val;
                                            },
                                            runSpacing: 20,
                                            choiceItems: C2Choice.listFrom<
                                                String, String>(
                                              source:
                                                  controller.volunteerOptions,
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
                                              backgroundColor:
                                                  kColourSidebarTile,
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
                                            'Add Volunteer',
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
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Road Zone',
                          style: kTextStyleTileText,
                        ),
                      ),
                      trailing: Obx(() => ChipsChoice<String>.multiple(
                            value: controller.roadZoneTags.value,
                            onChanged: (val) {
                              if (val.length > 1) {
                                val.removeAt(val.length - 2);
                                controller.roadZoneTags.value = val;
                              } else {
                                controller.roadZoneTags.value = val;
                              }
                            },
                            choiceItems: C2Choice.listFrom<String, String>(
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
                    ),
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Speed Limit (km/h)',
                          style: kTextStyleTileText,
                        ),
                      ),
                      trailing: Expanded(
                        flex: 3,
                        child: Obx(() => Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ChipsChoice<String>.multiple(
                                value: controller.speedLimitTags.value,
                                onChanged: (val) {
                                  if (val.length > 1) {
                                    val.removeAt(val.length - 2);
                                    controller.speedLimitTags.value = val;
                                  } else {
                                    controller.speedLimitTags.value = val;
                                  }
                                },
                                choiceItems: C2Choice.listFrom<String, String>(
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
                              ),
                            )),
                      ),
                    ),
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text('Weather Conditions'),
                      ),
                      trailing: Obx(() => ChipsChoice<String>.multiple(
                            value: controller.weatherTags.value,
                            onChanged: (val) {
                              if (val.length > 1) {
                                val.removeAt(val.length - 2);
                                controller.weatherTags.value = val;
                              } else {
                                controller.weatherTags.value = val;
                              }
                            },
                            choiceItems: C2Choice.listFrom<String, String>(
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
                    ),
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text('Road Conditions'),
                      ),
                      trailing: Obx(() => ChipsChoice<String>.multiple(
                            value: controller.roadConditionTags.value,
                            onChanged: (val) {
                              if (val.length > 1) {
                                val.removeAt(val.length - 2);
                                controller.roadConditionTags.value = val;
                              } else {
                                controller.roadConditionTags.value = val;
                              }
                            },
                            choiceItems: C2Choice.listFrom<String, String>(
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
                    ),
                    SettingsTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text('Lighting'),
                      ),
                      trailing: Obx(() => ChipsChoice<String>.multiple(
                            value: controller.roadLightingTags.value,
                            onChanged: (val) {
                              if (val.length > 1) {
                                val.removeAt(val.length - 2);
                                controller.roadLightingTags.value = val;
                              } else {
                                controller.roadLightingTags.value = val;
                              }
                            },
                            choiceItems: C2Choice.listFrom<String, String>(
                              source: controller.roadLightingOptions,
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
                  ]),
                  SettingsSection(tiles: [
                    CustomSettingsTile(
                      child: Container(
                        height: 66,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ],
      ),
    );
  }
}

class DateTimePicker extends GetView<CreateSessionController> {
  bool isStart;

  DateTimePicker({
    Key? key,
    required this.isStart,
  }) : super(key: key);

  final DateFormat formatter = DateFormat('MMMM d, y h:mm aa');

  @override
  Widget build(BuildContext context) {
    return Obx(() => ChipsChoice<String>.multiple(
          value:
              isStart ? controller.startTags.value : controller.endTags.value,
          onChanged: (val) {
            showPopover(
              context: context,
              transitionDuration: const Duration(milliseconds: 150),
              bodyBuilder: (context) => CupertinoTheme(
                data: CupertinoThemeData(brightness: Brightness.dark),
                child: CupertinoDatePicker(
                  onDateTimeChanged: (dateTime) {
                    if (isStart) {
                      controller.startTags.value = [formatter.format(dateTime)];
                      controller.startOptions = [formatter.format(dateTime)];
                      controller.startDate.value = dateTime;
                    } else {
                      controller.endTags.value = [formatter.format(dateTime)];
                      controller.endOptions = [formatter.format(dateTime)];
                      controller.endDate.value = dateTime;
                    }

                    if (controller.startDate.value
                            .difference(controller.endDate.value) >
                        Duration(minutes: 1)) {
                      controller.endTags.value = [
                        formatter.format(controller.startDate.value
                            .add(Duration(minutes: 1)))
                      ];
                      controller.endOptions = [
                        formatter.format(controller.startDate.value
                            .add(Duration(minutes: 1)))
                      ];
                      controller.endDate.value =
                          controller.startDate.value.add(Duration(hours: 1));
                    }
                  },
                  initialDateTime: isStart
                      ? controller.startDate.value
                      : controller.endDate.value,
                ),
              ),
              direction: PopoverDirection.left,
              width: Get.width / 3.2,
              height: Get.height / 4,
              onPop: () {
                if (isStart) {
                  controller.startTags.value = [
                    formatter.format(controller.startDate.value)
                  ];
                  controller.startOptions = [
                    formatter.format(controller.startDate.value)
                  ];
                } else {
                  controller.endTags.value = [
                    formatter.format(controller.endDate.value)
                  ];
                  controller.endOptions = [
                    formatter.format(controller.endDate.value)
                  ];
                }
              },
              arrowHeight: 15,
              arrowWidth: 30,
              backgroundColor: kColourRightPaneBackground,
            );
          },
          choiceItems: C2Choice.listFrom<String, String>(
            source: isStart ? controller.startOptions : controller.endOptions,
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
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          choiceStyle: C2ChoiceStyle(
            color: Colors.white,
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            padding: EdgeInsets.all(10.0),
            backgroundColor: kColourSidebarTile,
            borderColor: kColourLight,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          runSpacing: 20,
        ));
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
  final TextInputType keyboardType;

  SessionTextFieldEntry({
    Key? key,
    required this.placeholder,
    required this.keyboardType,
    required this.textEditingController,
    this.onSubmitted,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: textEditingController,
      keyboardType: keyboardType,
      cursorColor: kColourLight,
      decoration: BoxDecoration(
          color: kColourSidebarTile,
          borderRadius: BorderRadius.all(Radius.circular(9.0))),
      keyboardAppearance: Brightness.dark,
      placeholder: placeholder,
      placeholderStyle: kTextStyleTilePlaceholder,
      textCapitalization: TextCapitalization.sentences,
      style: kTextStyleTileText,
      suffix: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FaIcon(
          CupertinoIcons.clear_circled_solid,
          color: kColourSuffixIcon,
        ),
      ),
      suffixMode: OverlayVisibilityMode.editing,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTap: () {
        textEditingController.clear();
      },
    );
  }
}
