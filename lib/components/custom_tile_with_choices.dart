import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/controllers/create_session_controller.dart';
import '../constants.dart';

class CustomTileWithChoices extends GetView<CreateSessionController> {
  final String leadingText;
  final RxInt tileTag;
  final List<String> tileOptions;
  final Widget? trailing;

  CustomTileWithChoices(
      {Key? key,
      required this.leadingText,
      required this.tileTag,
      required this.tileOptions,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            leadingText,
            style: kTextStyleTileText,
          ),
        ),
        trailing: trailing != null
            ? trailing
            : Obx(
                () => Expanded(
                  flex: 4,
                  child: ChipsChoice<int>.single(
                    value: tileTag.value,
                    onChanged: (val) => tileTag.value = val,
                    choiceItems: C2Choice.listFrom<int, String>(
                      source: tileOptions,
                      value: (i, v) => i,
                      label: (i, v) => v,
                    ),
                    choiceActiveStyle: choiceActiveStyle,
                    choiceStyle: choiceStyle,
                  ),
                ),
              ));
  }
}
