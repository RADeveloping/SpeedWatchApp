import 'package:isar/isar.dart';
import '../enums/vehicle_type.dart';

class VehicleTypeConverter extends TypeConverter<VehicleType, int> {
  const VehicleTypeConverter(); // Converters need to have an empty const constructor

  @override
  VehicleType fromIsar(int vehicleTypeIndex) {
    return VehicleType.values[vehicleTypeIndex];
  }

  @override
  int toIsar(VehicleType type) {
    return type.index;
  }
}