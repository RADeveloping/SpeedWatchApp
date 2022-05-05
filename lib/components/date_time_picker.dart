import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:speedwatch/controllers/session_controller.dart';
import 'package:popover/popover.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class DatePickerChoice extends StatelessWidget {
  final DateFormat formatter = DateFormat('MMMM d, y h:mm aa');
  late Rx<DateTime> date;
  late DateTimePickerController controller;
  late DateTime minDate;
  late Function(DateTime)? onChange;

  DatePickerChoice(
      {required DateTime dateTime,
      DateTime? minDate,
      Function(DateTime)? onChange}) {
    this.date = dateTime.obs;
    if (minDate == null) {
      minDate = DateTime.now();
    }
    this.minDate = minDate;
    this.onChange = onChange;
    controller = DateTimePickerController(date: date);
  }

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
                      this.date.value = dateTime;
                      if (onChange != null) {
                        onChange!(dateTime);
                      }
                    },
                    minimumDate: minDate.add(Duration(minutes: -1)),
                    initialDateTime: date.value,
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
              source: [formatter.format(date.value)],
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
