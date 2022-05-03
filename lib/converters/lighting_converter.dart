import 'package:isar/isar.dart';

import '../enums/lighting.dart';

class LightingConverter extends TypeConverter<Lighting, int> {
  const LightingConverter();

  @override
  Lighting fromIsar(int lightingIndex) {
    return Lighting.values[lightingIndex];
  }

  @override
  int toIsar(Lighting lighting) {
    return lighting.index;
  }

}