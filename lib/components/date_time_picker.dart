import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedwatch/controllers/create_session_controller.dart';
import 'package:popover/popover.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class DateTimePicker extends GetView<CreateSessionController> {
  bool isStart;

  DateTimePicker({
    Key? key,
    required this.isStart,
  }) : super(key: key);

  final DateFormat formatter = DateFormat('MMMM d, y h:mm aa');

  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
          color: Colors.transparent,
          child: ChipsChoice<int>.single(
            value: 0,
            onChanged: (val) {
              showPopover(
                barrierColor: Colors.black.withOpacity(0.75),
                context: context,
                transitionDuration: const Duration(milliseconds: 150),
                bodyBuilder: (context) => CupertinoTheme(
                  data: CupertinoThemeData(brightness: Brightness.dark),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (dateTime) {
                      if (isStart) {
                        controller.startDate.value = dateTime;
                        controller.startOptions.value = [
                          formatter.format(dateTime)
                        ];

                        controller.endOptions.value = [
                          formatter.format(controller.startDate.value
                              .add(Duration(hours: 1)))
                        ];
                        controller.endDate.value =
                            controller.startDate.value.add(Duration(hours: 1));
                      } else {
                        controller.endDate.value = dateTime;
                        controller.endOptions.value = [
                          formatter.format(dateTime)
                        ];
                      }
                    },
                    minimumDate: isStart
                        ? DateTime.now()
                        : controller.startDate.value.add(Duration(minutes: 1)),
                    initialDateTime: isStart
                        ? controller.startDate.value.add(Duration(seconds: 30))
                        : controller.startDate.value.add(Duration(hours: 1)),
                  ),
                ),
                direction: PopoverDirection.left,
                height: 200,
                width: 350,
                onPop: () {},
                arrowHeight: 15,
                arrowWidth: 30,
                backgroundColor: kColourRightPaneBackground,
              );
            },
            choiceItems: C2Choice.listFrom<int, String>(
              source: isStart ? controller.startOptions : controller.endOptions,
              value: (i, v) => i,
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
          ),
        ));
  }
}
