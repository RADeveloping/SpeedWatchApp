import 'package:isar/isar.dart';

part 'settings_collection.g.dart';

@Collection()
class SettingsCollection {
  late int id;
  late String key;
  late List<String> value;
}