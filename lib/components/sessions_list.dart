import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/collections/session_collection.dart';
import 'package:speedwatch/components/session_detail.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';
import 'package:speedwatch/services/db_service.dart';

import '../constants.dart';

class SessionsList extends GetView<SidebarController> {
  RxBool editModeActive = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Obx(() => SettingsList(
                applicationType: ApplicationType.both,
                brightness: Brightness.light,
                lightTheme: SettingsThemeData(
                  settingsListBackground: kColourSidebarBackground,
                  settingsSectionBackground: kColourSidebarTile,
                  settingsTileTextColor: kColourSidebarTileText,
                  tileHighlightColor: kColourLight,
                  dividerColor: kColourTileDivider,
                ),
                sections: buildList(context),
              )),
        ),
      ],
    );
  }

  List<AbstractSettingsSection> buildList(BuildContext context) {
    List<SessionCollection> mainList = [];
    List<SessionCollection> archivedList = [];

    groupBy(controller.sessions,
            (obj) => (obj as SessionCollection).hasExportedSession)
        .forEach((hasExportedSession, groupedList) {
      if (hasExportedSession) {
        archivedList = groupedList;
      } else {
        mainList = groupedList;
      }
    });

    List<AbstractSettingsSection> list =
        controller.sessions.isEmpty ? [] : [searchBar()];

    if (controller.isSearching == true) {
      List<SessionCollection> searchSessions = controller.sessions
          .where((element) => element.streetAddress.isCaseInsensitiveContains(
              controller.textController.value.value.text))
          .toList();
      groupBy(
              searchSessions.take(controller.limitSessionsMain.value),
              (obj) => DateFormat('EEEEEE, MMMM dd, y')
                  .format((obj as SessionCollection).startTime))
          .forEach((date, groupedList) {
        list.add(sessionListSection(groupedList, date.toUpperCase(), false));
      });
      if (searchSessions.length > controller.limitSessionsMain.value) {
        list.add(moreItems(false));
      }
    } else {
      groupBy(
              mainList.take(controller.limitSessionsMain.value),
              (obj) => DateFormat('EEEEEE, MMMM dd, y')
                  .format((obj as SessionCollection).startTime))
          .forEach((date, groupedList) {
        list.add(sessionListSection(groupedList, date.toUpperCase(), false));
      });
      if (mainList.length > controller.limitSessionsMain.value) {
        list.add(moreItems(false));
      }
      archivedList.length > 0 ? list.add(archivedTab(context)) : null;
      groupBy(
              archivedList.take(controller.limitSessionsArchived.value),
              (obj) => DateFormat('EEEEEE, MMMM dd, y')
                  .format((obj as SessionCollection).startTime))
          .forEach((date, groupedList) {
        list.add(sessionListSection(groupedList, date.toUpperCase(), true));
      });
      if (archivedList.length > controller.limitSessionsArchived.value) {
        list.add(moreItems(true));
      }
    }

    return list;
  }

  CustomSettingsSection searchBar() {
    return CustomSettingsSection(
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
                    if (controller.textController.value.value.text != '') {
                      controller.isSearching.value = true;
                    } else {
                      controller.isSearching.value = false;
                    }
                    controller.sessions.refresh();
                  },
                  onSubmitted: (String value) {
                    print('Submitted text: $value');
                  },
                  onSuffixTap: () {
                    controller.textController.value.clear();
                    controller.isSearching.value = false;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomSettingsSection sessionListSection(
      List<SessionCollection> sessions, String date, bool archivable) {
    return CustomSettingsSection(
        child: !archivable
            ? SettingsSection(
                title: Text(date),
                tiles: sessions.isNotEmpty
                    ? sessions
                        .map((session) => sessionListItem(session))
                        .toList()
                    : [SettingsTile.navigation(title: Text(''))],
              )
            : controller.archiveExpanded.value
                ? SettingsSection(
                    title: Text(date),
                    tiles: sessions.isNotEmpty
                        ? sessions
                            .map((session) => sessionListItem(session))
                            .toList()
                        : [SettingsTile.navigation(title: Text(''))])
                : Container());
  }

  CustomSettingsSection moreItems(bool archivable) {
    return CustomSettingsSection(
        child: !archivable
            ? SettingsSection(
                title: Text(''),
                tiles: [
                  SettingsTile(
                    title: Center(child: Text('Load more')),
                    onPressed: (c) {
                      controller.limitSessionsMain.value += 20;
                    },
                  )
                ],
              )
            : controller.archiveExpanded.value
                ? SettingsSection(
                    title: Text(''),
                    tiles: [
                      SettingsTile(
                          title: Center(child: Text('Load more')),
                          onPressed: (c) {
                            controller.limitSessionsArchived.value += 20;
                          })
                    ],
                  )
                : Container());
  }

  SettingsTile sessionListItem(SessionCollection session) {
    return SettingsTile.navigation(
      leading: Obx(() => controller.isEditMode.value
          ? controller.selectedSessions.value.contains(session)
              ? Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: kColourLight,
                )
              : Icon(
                  CupertinoIcons.circle,
                  color: kColourLight,
                )
          : Container()),
      title: Text(
        session.streetAddress,
        style: kTextStyleSidebarTile,
      ),
      key: Key(session.toString()),
      trailing: controller.isEditMode.value
          ? Container()
          : Row(
              children: [
                Text(
                  '',
                  style: kTextStyleTilePlaceholder,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                  child: Icon(
                    CupertinoIcons.chevron_forward,
                    size: Get.textScaleFactor * 18,
                    color: kColourPlaceHolderText,
                  ),
                )
              ],
            ),
      onPressed: (BuildContext context) {
        if (!controller.isEditMode.value) {
          SessionDetailDetailController sessionDetailController = Get.find();
          sessionDetailController.sliding.value = 0;
          DbService dbService = Get.find();
          controller.records.value = [];
          controller.filterByInfraction.value = false;
          controller.filterByImagePath.value = false;
          controller.limitRecords.value = 20;
          controller.currentSession.value = session;
          controller.isSessionCompleted.value = !DateTime.now().isBefore(controller.currentSession.value.endTime);

          Function callBack = () => Get.offAndToNamed('/session/${session.id}');
          dbService.getRecordsWithId(
              controller.handleNewRecords, session.id, callBack);
          dbService.getDeletedRecordsWithId(
              controller.handleDeletedRecords, session.id, callBack);
        }

        if (controller.isEditMode.value) {
          if (controller.selectedSessions.contains(session)) {
            controller.selectedSessions.remove(session);
          } else {
            controller.selectedSessions.value.add(session);
          }
        }
        controller.selectedSessions.refresh();
      },
    );
  }

  CustomSettingsSection archivedTab(BuildContext context) {
    return CustomSettingsSection(
      child: CustomSettingsTile(
        child: GestureDetector(
          onTap: () => controller.archiveExpanded.value =
              !controller.archiveExpanded.value,
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
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
                          size: 18 * MediaQuery.of(context).textScaleFactor,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
