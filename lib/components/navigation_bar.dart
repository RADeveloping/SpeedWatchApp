import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speedwatch/constants.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import '../collections/session_collection.dart';
import '../controllers/session_controller.dart';
import '../services/export_service.dart';

class NavigationBarCustom extends GetView<SidebarController> {
  final Widget child;
  final String largeTitle;
  final SessionController sessionController = Get.find();
  final BuildContext? outerContext;

  NavigationBarCustom(
      {required this.child, required this.largeTitle, this.outerContext});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        body:
            CupertinoPageScaffold(resizeToAvoidBottomInset: true, child: child),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(() => CupertinoSliverNavigationBar(
                previousPageTitle: Get.previousRoute.length > 0
                    ? Get.previousRoute.split('/')[1]
                    : '',
                heroTag: 0,
                leading: controller.isEditMode.value && largeTitle == 'Sessions'
                    ? Obx(() => CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Text(
                            controller.selectedSessions.toSet().containsAll(
                                    controller.sessions
                                        .where((session) =>
                                            !session.hasExportedSession)
                                        .toList())
                                ? 'Deselect All'
                                : 'Select All',
                          ),
                          onPressed: () {
                            if (controller.selectedSessions.toSet().containsAll(
                                controller.sessions
                                    .where((session) =>
                                        !session.hasExportedSession)
                                    .toList())) {
                              controller.selectedSessions.clear();
                            } else {
                              controller.selectedSessions.addAllUnique(
                                  controller.sessions
                                      .where((session) =>
                                          !session.hasExportedSession)
                                      .toList());
                              controller.selectedSessions.refresh();
                            }
                          },
                        ))
                    : largeTitle == 'Edit Session' ||
                            largeTitle == 'Create Session'
                        ? DiscardChangesButton(
                            sessionController: sessionController,
                            outerContext: outerContext!,
                          )
                        : null,
                brightness: Brightness.dark,
                backgroundColor: kColourRightPaneBackground,
                largeTitle: Obx(() => Text(
                      controller.isEditMode.value &&
                              controller.selectedSessions.isNotEmpty &&
                              largeTitle == 'Sessions'
                          ? '${controller.selectedSessions.length} Selected'
                          : largeTitle.isEmpty
                              ? ''
                              : largeTitle,
                      style: TextStyle(color: Colors.white),
                    )),
                trailing: (Get.currentRoute
                            .isCaseInsensitiveContains('create') ||
                        Get.currentRoute.isCaseInsensitiveContains('edit'))
                    ? null
                    : (largeTitle == 'Sessions')
                        ? Obx(() => controller.sessions.length > 0
                            ? CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: controller.isEditMode.value
                                    ? Text(
                                        'Done',
                                        style: TextStyle(color: kColourLight),
                                      )
                                    : Text(
                                        'Select',
                                        style: TextStyle(color: kColourLight),
                                      ),
                                onPressed: () {
                                  if (controller.isEditMode.value) {
                                    controller.isEditMode.value = false;
                                  } else {
                                    controller.isEditMode.value = true;
                                    controller.selectedSessions().clear();
                                  }
                                },
                              )
                            : Text(''))
                        : GestureDetector(
                            onTapDown: (positioned) {
                              ShowExportShareSheet(positioned, context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                CupertinoIcons.share_up,
                                size: 24.0,
                                color: kColourLight,
                              ),
                            ),
                          ))),
          ];
        });
  }

  String getFilename(List<String> directories) {
    if (directories.length > 1) {
      return (directories.length.toString() + ' Documents');
    } else if (directories.length == 1) {
      return (directories[0].split('/').last);
    }
    return '';
  }

  Future<void> ShowExportShareSheet(
      TapDownDetails positioned, BuildContext context) async {
    if (controller.isShareSheetOpening == true) {
      return;
    }
    controller.isShareSheetOpening = true;
    List<String> directories = [
      await ExportService()
          .exportSessionToExcel(controller.currentSession.value)
    ];

    final result = await Share.shareFilesWithResult(
      directories,
      subject: getFilename(directories),
      sharePositionOrigin: Rect.fromLTWH(
          positioned.globalPosition.dx, positioned.globalPosition.dy, 1, 1),
    );
    if (result.status == ShareResultStatus.dismissed) {
      controller.isShareSheetOpening = false;
    } else if (result.status == ShareResultStatus.success) {
      if (!controller.currentSession.value.hasExportedSession) {
        ShowConfirmMoveDialog(context);
      }
      controller.isShareSheetOpening = false;
    }
  }

  void ShowConfirmMoveDialog(BuildContext context) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.dark),
            child: Container(
              color: Colors.black.withValues(alpha: 0.6),
              child: CupertinoAlertDialog(
                  title: const Text('Move Session to "Archived"'),
                  actions: <CupertinoDialogAction>[
                    CupertinoDialogAction(
                        child: const Text(
                          'Don\'t Move',
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    CupertinoDialogAction(
                        child: const Text(
                          'Move',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          DbService dbService = Get.find();
                          dbService.setHasSingleExportedSession(
                              controller.currentSession.value);
                          Navigator.pop(context);
                        })
                  ]),
            )));
  }

  Container HandleSelect(BuildContext context) {
    if (controller.isEditMode.value == true) {
      if (controller.sessions.firstWhereOrNull(
              (element) => element.hasExportedSession == false) ==
          null) {
        // Has No New Session
        return Container(
          height: 50,
          color: Colors.transparent,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: controller.selectedSessions.isEmpty
                      ? Container()
                      : GestureDetector(
                          onTapDown: (positioned) {
                            ShowSelectedExportShareSheet(positioned, context);
                          },
                          child: Text(
                            'Export',
                            style: TextStyle(color: kColourLight),
                          ),
                        ))),
        );
      } else {
        // Has New Session
        return Container(
          height: 50,
          color: Colors.transparent,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: controller.selectedSessions.isEmpty
                      ? Text(
                          'Export',
                          style: TextStyle(color: kColourDisabledButton),
                        )
                      : GestureDetector(
                          onTapDown: (positioned) {
                            ShowSelectedExportShareSheet(positioned, context);
                          },
                          child: Text(
                            'Export',
                            style: TextStyle(color: kColourLight),
                          ),
                        ))),
        );
      }
    } else {
      return Container();
    }
  }

  Future<void> ShowSelectedExportShareSheet(
      TapDownDetails positioned, BuildContext context) async {
    List<String> directories = await ExportService()
        .exportSessionsToExcel(controller.selectedSessions);

    final result = await Share.shareFilesWithResult(
      directories,
      subject: 'Export to Excel',
      sharePositionOrigin: Rect.fromLTWH(
          positioned.globalPosition.dx, positioned.globalPosition.dy, 1, 1),
    );

    if (result.status == ShareResultStatus.dismissed) {
      controller.isEditMode.value = false;
    } else if (result.status == ShareResultStatus.success) {
      if (isMoveNeeded(controller.selectedSessions.value)) {
        showMoveExportedAlertDialog(context);
      }
      controller.isEditMode.value = false;
    }
  }

  bool isMoveNeeded(List<SessionCollection> sessions) {
    for (var session in sessions) {
      if (!session.hasExportedSession) {
        return true;
      }
    }
    return false;
  }

  void showMoveExportedAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.dark),
            child: Container(
              color: Colors.black.withValues(alpha: 0.6),
              child: CupertinoAlertDialog(
                  title: Text(
                      'Move Session${controller.selectedSessions.value.length > 1 ? 's' : ''} to "Archived"'),
                  actions: <CupertinoDialogAction>[
                    CupertinoDialogAction(
                        child: const Text(
                          'Don\'t Move',
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    CupertinoDialogAction(
                        child: const Text(
                          'Move',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          DbService dbService = Get.find();
                          dbService.setHasMultipleExportedSession(
                              controller.selectedSessions);
                          Navigator.pop(context);
                        })
                  ]),
            )));
  }
}

class DiscardChangesButton extends StatelessWidget {
  final BuildContext outerContext;

  const DiscardChangesButton(
      {Key? key, required this.sessionController, required this.outerContext})
      : super(key: key);

  final SessionController sessionController;

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
                onTap: () {
                  sessionController.address_textController().clear();
                  sessionController.volunteerTags().clear();
                  sessionController.volunteer_textController().clear();
                  sessionController.notes_textController().clear();
                  Navigator.pop(outerContext);
                  Get.back(closeOverlays: true);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Discard Changes',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                  ),
                ),
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

extension ListExtension<E> on List<E> {
  void addAllUnique(Iterable<E> iterable) {
    for (var element in iterable) {
      if (!contains(element)) {
        add(element);
      }
    }
  }
}
