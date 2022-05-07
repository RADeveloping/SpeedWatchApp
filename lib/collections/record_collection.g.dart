// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRecordCollectionCollection on Isar {
  IsarCollection<RecordCollection> get recordCollections => getCollection();
}

const RecordCollectionSchema = CollectionSchema(
  name: 'RecordCollection',
  schema:
      '{"name":"RecordCollection","idName":"id","properties":[{"name":"createdAt","type":"Long"},{"name":"sessionId","type":"Long"},{"name":"speedRange","type":"Long"},{"name":"vehicleType","type":"Long"}],"indexes":[{"name":"createdAt","unique":false,"properties":[{"name":"createdAt","type":"Value","caseSensitive":false}]},{"name":"sessionId","unique":false,"properties":[{"name":"sessionId","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'createdAt': 0,
    'sessionId': 1,
    'speedRange': 2,
    'vehicleType': 3
  },
  listProperties: {},
  indexIds: {'createdAt': 0, 'sessionId': 1},
  indexValueTypes: {
    'createdAt': [
      IndexValueType.long,
    ],
    'sessionId': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _recordCollectionGetId,
  setId: _recordCollectionSetId,
  getLinks: _recordCollectionGetLinks,
  attachLinks: _recordCollectionAttachLinks,
  serializeNative: _recordCollectionSerializeNative,
  deserializeNative: _recordCollectionDeserializeNative,
  deserializePropNative: _recordCollectionDeserializePropNative,
  serializeWeb: _recordCollectionSerializeWeb,
  deserializeWeb: _recordCollectionDeserializeWeb,
  deserializePropWeb: _recordCollectionDeserializePropWeb,
  version: 3,
);

int? _recordCollectionGetId(RecordCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _recordCollectionSetId(RecordCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase> _recordCollectionGetLinks(RecordCollection object) {
  return [];
}

const _recordCollectionSpeedRangeConverter = SpeedRangeConverter();
const _recordCollectionVehicleTypeConverter = VehicleTypeConverter();

void _recordCollectionSerializeNative(
    IsarCollection<RecordCollection> collection,
    IsarRawObject rawObj,
    RecordCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.createdAt;
  final _createdAt = value0;
  final value1 = object.sessionId;
  final _sessionId = value1;
  final value2 = _recordCollectionSpeedRangeConverter.toIsar(object.speedRange);
  final _speedRange = value2;
  final value3 =
      _recordCollectionVehicleTypeConverter.toIsar(object.vehicleType);
  final _vehicleType = value3;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _createdAt);
  writer.writeLong(offsets[1], _sessionId);
  writer.writeLong(offsets[2], _speedRange);
  writer.writeLong(offsets[3], _vehicleType);
}

RecordCollection _recordCollectionDeserializeNative(
    IsarCollection<RecordCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RecordCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.sessionId = reader.readLong(offsets[1]);
  object.speedRange = _recordCollectionSpeedRangeConverter
      .fromIsar(reader.readLong(offsets[2]));
  object.vehicleType = _recordCollectionVehicleTypeConverter
      .fromIsar(reader.readLong(offsets[3]));
  return object;
}

P _recordCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (_recordCollectionSpeedRangeConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 3:
      return (_recordCollectionVehicleTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _recordCollectionSerializeWeb(
    IsarCollection<RecordCollection> collection, RecordCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'sessionId', object.sessionId);
  IsarNative.jsObjectSet(jsObj, 'speedRange',
      _recordCollectionSpeedRangeConverter.toIsar(object.speedRange));
  IsarNative.jsObjectSet(jsObj, 'vehicleType',
      _recordCollectionVehicleTypeConverter.toIsar(object.vehicleType));
  return jsObj;
}

RecordCollection _recordCollectionDeserializeWeb(
    IsarCollection<RecordCollection> collection, dynamic jsObj) {
  final object = RecordCollection();
  object.createdAt = IsarNative.jsObjectGet(jsObj, 'createdAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'createdAt'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.sessionId =
      IsarNative.jsObjectGet(jsObj, 'sessionId') ?? double.negativeInfinity;
  object.speedRange = _recordCollectionSpeedRangeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'speedRange') ?? double.negativeInfinity);
  object.vehicleType = _recordCollectionVehicleTypeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'vehicleType') ?? double.negativeInfinity);
  return object;
}

P _recordCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'sessionId':
      return (IsarNative.jsObjectGet(jsObj, 'sessionId') ??
          double.negativeInfinity) as P;
    case 'speedRange':
      return (_recordCollectionSpeedRangeConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'speedRange') ??
              double.negativeInfinity)) as P;
    case 'vehicleType':
      return (_recordCollectionVehicleTypeConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'vehicleType') ??
              double.negativeInfinity)) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _recordCollectionAttachLinks(
    IsarCollection col, int id, RecordCollection object) {}

extension RecordCollectionQueryWhereSort
    on QueryBuilder<RecordCollection, RecordCollection, QWhere> {
  QueryBuilder<RecordCollection, RecordCollection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhere> anyCreatedAt() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'createdAt'));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhere> anySessionId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'sessionId'));
  }
}

extension RecordCollectionQueryWhere
    on QueryBuilder<RecordCollection, RecordCollection, QWhereClause> {
  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'createdAt',
      value: [createdAt],
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'createdAt',
        upper: [createdAt],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'createdAt',
        lower: [createdAt],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'createdAt',
        lower: [createdAt],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'createdAt',
        upper: [createdAt],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'createdAt',
      lower: [createdAt],
      includeLower: include,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'createdAt',
      upper: [createdAt],
      includeUpper: include,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'createdAt',
      lower: [lowerCreatedAt],
      includeLower: includeLower,
      upper: [upperCreatedAt],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      sessionIdEqualTo(int sessionId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'sessionId',
      value: [sessionId],
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      sessionIdNotEqualTo(int sessionId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'sessionId',
        upper: [sessionId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'sessionId',
        lower: [sessionId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'sessionId',
        lower: [sessionId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'sessionId',
        upper: [sessionId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      sessionIdGreaterThan(
    int sessionId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'sessionId',
      lower: [sessionId],
      includeLower: include,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      sessionIdLessThan(
    int sessionId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'sessionId',
      upper: [sessionId],
      includeUpper: include,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      sessionIdBetween(
    int lowerSessionId,
    int upperSessionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'sessionId',
      lower: [lowerSessionId],
      includeLower: includeLower,
      upper: [upperSessionId],
      includeUpper: includeUpper,
    ));
  }
}

extension RecordCollectionQueryFilter
    on QueryBuilder<RecordCollection, RecordCollection, QFilterCondition> {
  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      sessionIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sessionId',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      sessionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sessionId',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      sessionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sessionId',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      sessionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sessionId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      speedRangeEqualTo(SpeedRange value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'speedRange',
      value: _recordCollectionSpeedRangeConverter.toIsar(value),
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      speedRangeGreaterThan(
    SpeedRange value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'speedRange',
      value: _recordCollectionSpeedRangeConverter.toIsar(value),
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      speedRangeLessThan(
    SpeedRange value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'speedRange',
      value: _recordCollectionSpeedRangeConverter.toIsar(value),
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      speedRangeBetween(
    SpeedRange lower,
    SpeedRange upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'speedRange',
      lower: _recordCollectionSpeedRangeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _recordCollectionSpeedRangeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      vehicleTypeEqualTo(VehicleType value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'vehicleType',
      value: _recordCollectionVehicleTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      vehicleTypeGreaterThan(
    VehicleType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'vehicleType',
      value: _recordCollectionVehicleTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      vehicleTypeLessThan(
    VehicleType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'vehicleType',
      value: _recordCollectionVehicleTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      vehicleTypeBetween(
    VehicleType lower,
    VehicleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'vehicleType',
      lower: _recordCollectionVehicleTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _recordCollectionVehicleTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }
}

extension RecordCollectionQueryLinks
    on QueryBuilder<RecordCollection, RecordCollection, QFilterCondition> {}

extension RecordCollectionQueryWhereSortBy
    on QueryBuilder<RecordCollection, RecordCollection, QSortBy> {
  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortBySessionId() {
    return addSortByInternal('sessionId', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortBySessionIdDesc() {
    return addSortByInternal('sessionId', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortBySpeedRange() {
    return addSortByInternal('speedRange', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortBySpeedRangeDesc() {
    return addSortByInternal('speedRange', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByVehicleType() {
    return addSortByInternal('vehicleType', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByVehicleTypeDesc() {
    return addSortByInternal('vehicleType', Sort.desc);
  }
}

extension RecordCollectionQueryWhereSortThenBy
    on QueryBuilder<RecordCollection, RecordCollection, QSortThenBy> {
  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenBySessionId() {
    return addSortByInternal('sessionId', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenBySessionIdDesc() {
    return addSortByInternal('sessionId', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenBySpeedRange() {
    return addSortByInternal('speedRange', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenBySpeedRangeDesc() {
    return addSortByInternal('speedRange', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByVehicleType() {
    return addSortByInternal('vehicleType', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByVehicleTypeDesc() {
    return addSortByInternal('vehicleType', Sort.desc);
  }
}

extension RecordCollectionQueryWhereDistinct
    on QueryBuilder<RecordCollection, RecordCollection, QDistinct> {
  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<RecordCollection, RecordCollection, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctBySessionId() {
    return addDistinctByInternal('sessionId');
  }

  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctBySpeedRange() {
    return addDistinctByInternal('speedRange');
  }

  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctByVehicleType() {
    return addDistinctByInternal('vehicleType');
  }
}

extension RecordCollectionQueryProperty
    on QueryBuilder<RecordCollection, RecordCollection, QQueryProperty> {
  QueryBuilder<RecordCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<RecordCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<RecordCollection, int, QQueryOperations> sessionIdProperty() {
    return addPropertyNameInternal('sessionId');
  }

  QueryBuilder<RecordCollection, SpeedRange, QQueryOperations>
      speedRangeProperty() {
    return addPropertyNameInternal('speedRange');
  }

  QueryBuilder<RecordCollection, VehicleType, QQueryOperations>
      vehicleTypeProperty() {
    return addPropertyNameInternal('vehicleType');
  }
}
