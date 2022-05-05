import 'package:isar/isar.dart';
import '../enums/weather.dart';

class WeatherConverter extends TypeConverter<Weather, int> {
  const WeatherConverter(); // Converters need to have an empty const constructor

  @override
  Weather fromIsar(int weatherOptionsIndex) {
    return Weather.values[weatherOptionsIndex];
  }

  @override
  int toIsar(Weather type) {
    return type.index;
  }
}