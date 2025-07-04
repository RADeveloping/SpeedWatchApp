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
      '{"name":"RecordCollection","idName":"id","properties":[{"name":"createdAt","type":"Long"},{"name":"deletedAt","type":"Long"},{"name":"imagePath","type":"String"},{"name":"sessionId","type":"Long"},{"name":"speedRange","type":"Long"},{"name":"vehicleType","type":"Long"},{"name":"volunteerName","type":"String"}],"indexes":[{"name":"createdAt","unique":false,"properties":[{"name":"createdAt","type":"Value","caseSensitive":false}]},{"name":"deletedAt","unique":false,"properties":[{"name":"deletedAt","type":"Value","caseSensitive":false}]},{"name":"sessionId","unique":false,"properties":[{"name":"sessionId","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'createdAt': 0,
    'deletedAt': 1,
    'imagePath': 2,
    'sessionId': 3,
    'speedRange': 4,
    'vehicleType': 5,
    'volunteerName': 6
  },
  listProperties: {},
  indexIds: {'createdAt': 0, 'deletedAt': 1, 'sessionId': 2},
  indexValueTypes: {
    'createdAt': [
      IndexValueType.long,
    ],
    'deletedAt': [
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
  final value1 = object.deletedAt;
  final _deletedAt = value1;
  final value2 = object.imagePath;
  IsarUint8List? _imagePath;
  if (value2 != null) {
    _imagePath = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_imagePath?.length ?? 0) as int;
  final value3 = object.sessionId;
  final _sessionId = value3;
  final value4 = _recordCollectionSpeedRangeConverter.toIsar(object.speedRange);
  final _speedRange = value4;
  final value5 =
      _recordCollectionVehicleTypeConverter.toIsar(object.vehicleType);
  final _vehicleType = value5;
  final value6 = object.volunteerName;
  final _volunteerName = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_volunteerName.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _createdAt);
  writer.writeDateTime(offsets[1], _deletedAt);
  writer.writeBytes(offsets[2], _imagePath);
  writer.writeLong(offsets[3], _sessionId);
  writer.writeLong(offsets[4], _speedRange);
  writer.writeLong(offsets[5], _vehicleType);
  writer.writeBytes(offsets[6], _volunteerName);
}

RecordCollection _recordCollectionDeserializeNative(
    IsarCollection<RecordCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RecordCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.imagePath = reader.readStringOrNull(offsets[2]);
  object.sessionId = reader.readLong(offsets[3]);
  object.speedRange = _recordCollectionSpeedRangeConverter
      .fromIsar(reader.readLong(offsets[4]));
  object.vehicleType = _recordCollectionVehicleTypeConverter
      .fromIsar(reader.readLong(offsets[5]));
  object.volunteerName = reader.readString(offsets[6]);
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_recordCollectionSpeedRangeConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 5:
      return (_recordCollectionVehicleTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _recordCollectionSerializeWeb(
    IsarCollection<RecordCollection> collection, RecordCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(
      jsObj, 'deletedAt', object.deletedAt?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'imagePath', object.imagePath);
  IsarNative.jsObjectSet(jsObj, 'sessionId', object.sessionId);
  IsarNative.jsObjectSet(jsObj, 'speedRange',
      _recordCollectionSpeedRangeConverter.toIsar(object.speedRange));
  IsarNative.jsObjectSet(jsObj, 'vehicleType',
      _recordCollectionVehicleTypeConverter.toIsar(object.vehicleType));
  IsarNative.jsObjectSet(jsObj, 'volunteerName', object.volunteerName);
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
  object.deletedAt = IsarNative.jsObjectGet(jsObj, 'deletedAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'deletedAt'),
              isUtc: true)
          .toLocal()
      : null;
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.imagePath = IsarNative.jsObjectGet(jsObj, 'imagePath');
  object.sessionId =
      IsarNative.jsObjectGet(jsObj, 'sessionId') ?? double.negativeInfinity;
  object.speedRange = _recordCollectionSpeedRangeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'speedRange') ?? double.negativeInfinity);
  object.vehicleType = _recordCollectionVehicleTypeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'vehicleType') ?? double.negativeInfinity);
  object.volunteerName = IsarNative.jsObjectGet(jsObj, 'volunteerName') ?? '';
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
    case 'deletedAt':
      return (IsarNative.jsObjectGet(jsObj, 'deletedAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'deletedAt'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'imagePath':
      return (IsarNative.jsObjectGet(jsObj, 'imagePath')) as P;
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
    case 'volunteerName':
      return (IsarNative.jsObjectGet(jsObj, 'volunteerName') ?? '') as P;
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

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhere> anyDeletedAt() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'deletedAt'));
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
      deletedAtEqualTo(DateTime? deletedAt) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'deletedAt',
      value: [deletedAt],
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      deletedAtNotEqualTo(DateTime? deletedAt) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'deletedAt',
        upper: [deletedAt],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'deletedAt',
        lower: [deletedAt],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'deletedAt',
        lower: [deletedAt],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'deletedAt',
        upper: [deletedAt],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      deletedAtIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'deletedAt',
      value: [null],
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      deletedAtIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'deletedAt',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      deletedAtGreaterThan(
    DateTime? deletedAt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'deletedAt',
      lower: [deletedAt],
      includeLower: include,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      deletedAtLessThan(
    DateTime? deletedAt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'deletedAt',
      upper: [deletedAt],
      includeUpper: include,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterWhereClause>
      deletedAtBetween(
    DateTime? lowerDeletedAt,
    DateTime? upperDeletedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'deletedAt',
      lower: [lowerDeletedAt],
      includeLower: includeLower,
      upper: [upperDeletedAt],
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
      deletedAtIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'deletedAt',
      value: null,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deletedAt',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'deletedAt',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'deletedAt',
      value: value,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'deletedAt',
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
      imagePathIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'imagePath',
      value: null,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'imagePath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'imagePath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'imagePath',
      value: pattern,
      caseSensitive: caseSensitive,
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

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'volunteerName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'volunteerName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'volunteerName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'volunteerName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'volunteerName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'volunteerName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'volunteerName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterFilterCondition>
      volunteerNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'volunteerName',
      value: pattern,
      caseSensitive: caseSensitive,
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

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByDeletedAt() {
    return addSortByInternal('deletedAt', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByDeletedAtDesc() {
    return addSortByInternal('deletedAt', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByImagePath() {
    return addSortByInternal('imagePath', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByImagePathDesc() {
    return addSortByInternal('imagePath', Sort.desc);
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

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByVolunteerName() {
    return addSortByInternal('volunteerName', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      sortByVolunteerNameDesc() {
    return addSortByInternal('volunteerName', Sort.desc);
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

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByDeletedAt() {
    return addSortByInternal('deletedAt', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByDeletedAtDesc() {
    return addSortByInternal('deletedAt', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByImagePath() {
    return addSortByInternal('imagePath', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByImagePathDesc() {
    return addSortByInternal('imagePath', Sort.desc);
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

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByVolunteerName() {
    return addSortByInternal('volunteerName', Sort.asc);
  }

  QueryBuilder<RecordCollection, RecordCollection, QAfterSortBy>
      thenByVolunteerNameDesc() {
    return addSortByInternal('volunteerName', Sort.desc);
  }
}

extension RecordCollectionQueryWhereDistinct
    on QueryBuilder<RecordCollection, RecordCollection, QDistinct> {
  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctByDeletedAt() {
    return addDistinctByInternal('deletedAt');
  }

  QueryBuilder<RecordCollection, RecordCollection, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctByImagePath({bool caseSensitive = true}) {
    return addDistinctByInternal('imagePath', caseSensitive: caseSensitive);
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

  QueryBuilder<RecordCollection, RecordCollection, QDistinct>
      distinctByVolunteerName({bool caseSensitive = true}) {
    return addDistinctByInternal('volunteerName', caseSensitive: caseSensitive);
  }
}

extension RecordCollectionQueryProperty
    on QueryBuilder<RecordCollection, RecordCollection, QQueryProperty> {
  QueryBuilder<RecordCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<RecordCollection, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return addPropertyNameInternal('deletedAt');
  }

  QueryBuilder<RecordCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<RecordCollection, String?, QQueryOperations>
      imagePathProperty() {
    return addPropertyNameInternal('imagePath');
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

  QueryBuilder<RecordCollection, String, QQueryOperations>
      volunteerNameProperty() {
    return addPropertyNameInternal('volunteerName');
  }
}
