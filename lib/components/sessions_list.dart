import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speedwatch/collections/session_collection.dart';
import 'package:speedwatch/controllers/sidebar_controller.dart';

import '../constants.dart';

class SessionsList extends GetView<SidebarController> {
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
    List<CustomSettingsSection> sessionList = controller.sessions.map((session)=> sessionListSection([session], session.startTime.toString(), false)).toList();
    List<AbstractSettingsSection> list = [searchBar()];

    for (final s in sessionList) {
      list.add(s);
    }
    list.add(archivedTab(context));
    list.add(sessionListSection(controller.sessions, "yo", true));

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
    );
  }

  CustomSettingsSection sessionListSection(List<SessionCollection> sessions, String date, bool archivable) {
    return CustomSettingsSection(
        child: !archivable ? SettingsSection(
          title: Text(date),
          tiles: sessions.isNotEmpty ? sessions
              .map((session) => sessionListItem(session))
              .toList() : [SettingsTile.navigation(title: Text(""))],
        ):
        controller.archiveExpanded.value ? SettingsSection(
    title: Text(date),
    tiles: sessions.isNotEmpty ? sessions
        .map((session) => sessionListItem(session))
        .toList() : [SettingsTile.navigation(title: Text(""))] ) : Container());
  }



  SettingsTile sessionListItem(SessionCollection session) {
    return SettingsTile.navigation(
      title: Text(
        session.streetAddress,
        style: kTextStyleSidebarTile,
      ),
      value: Text('599'),
      onPressed: (BuildContext context) {
        Get.toNamed('/session/${session.id}');
      },
    );
  }

  CustomSettingsSection archivedTab(BuildContext context) {
    return CustomSettingsSection(
      child: CustomSettingsTile(
        child: GestureDetector(
          onTap: () => controller.archiveExpanded.value =
          !controller.archiveExpanded.value,
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
                    size: 18 *
                        MediaQuery.of(context).textScaleFactor,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
