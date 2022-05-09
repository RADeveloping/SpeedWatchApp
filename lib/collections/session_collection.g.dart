// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSessionCollectionCollection on Isar {
  IsarCollection<SessionCollection> get sessionCollections => getCollection();
}

const SessionCollectionSchema = CollectionSchema(
  name: 'SessionCollection',
  schema:
      '{"name":"SessionCollection","idName":"id","properties":[{"name":"direction","type":"Long"},{"name":"endTime","type":"Long"},{"name":"hasExportedSession","type":"Bool"},{"name":"roadConditionOptions","type":"Long"},{"name":"roadLightingOptions","type":"Long"},{"name":"roadZoneOptions","type":"Long"},{"name":"speedLimit","type":"Long"},{"name":"startTime","type":"Long"},{"name":"streetAddress","type":"String"},{"name":"volunteerNames","type":"StringList"},{"name":"weatherOptions","type":"Long"}],"indexes":[{"name":"startTime","unique":false,"properties":[{"name":"startTime","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'direction': 0,
    'endTime': 1,
    'hasExportedSession': 2,
    'roadConditionOptions': 3,
    'roadLightingOptions': 4,
    'roadZoneOptions': 5,
    'speedLimit': 6,
    'startTime': 7,
    'streetAddress': 8,
    'volunteerNames': 9,
    'weatherOptions': 10
  },
  listProperties: {'volunteerNames'},
  indexIds: {'startTime': 0},
  indexValueTypes: {
    'startTime': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _sessionCollectionGetId,
  setId: _sessionCollectionSetId,
  getLinks: _sessionCollectionGetLinks,
  attachLinks: _sessionCollectionAttachLinks,
  serializeNative: _sessionCollectionSerializeNative,
  deserializeNative: _sessionCollectionDeserializeNative,
  deserializePropNative: _sessionCollectionDeserializePropNative,
  serializeWeb: _sessionCollectionSerializeWeb,
  deserializeWeb: _sessionCollectionDeserializeWeb,
  deserializePropWeb: _sessionCollectionDeserializePropWeb,
  version: 3,
);

int? _sessionCollectionGetId(SessionCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _sessionCollectionSetId(SessionCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase> _sessionCollectionGetLinks(SessionCollection object) {
  return [];
}

const _sessionCollectionDirectionConverter = DirectionConverter();
const _sessionCollectionRoadConditionConverter = RoadConditionConverter();
const _sessionCollectionLightingConverter = LightingConverter();
const _sessionCollectionRoadZoneConverter = RoadZoneConverter();
const _sessionCollectionWeatherConverter = WeatherConverter();

void _sessionCollectionSerializeNative(
    IsarCollection<SessionCollection> collection,
    IsarRawObject rawObj,
    SessionCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = _sessionCollectionDirectionConverter.toIsar(object.direction);
  final _direction = value0;
  final value1 = object.endTime;
  final _endTime = value1;
  final value2 = object.hasExportedSession;
  final _hasExportedSession = value2;
  final value3 = _sessionCollectionRoadConditionConverter
      .toIsar(object.roadConditionOptions);
  final _roadConditionOptions = value3;
  final value4 =
      _sessionCollectionLightingConverter.toIsar(object.roadLightingOptions);
  final _roadLightingOptions = value4;
  final value5 =
      _sessionCollectionRoadZoneConverter.toIsar(object.roadZoneOptions);
  final _roadZoneOptions = value5;
  final value6 = object.speedLimit;
  final _speedLimit = value6;
  final value7 = object.startTime;
  final _startTime = value7;
  final value8 = object.streetAddress;
  final _streetAddress = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_streetAddress.length) as int;
  final value9 = object.volunteerNames;
  dynamicSize += (value9.length) * 8;
  final bytesList9 = <IsarUint8List>[];
  for (var str in value9) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList9.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _volunteerNames = bytesList9;
  final value10 =
      _sessionCollectionWeatherConverter.toIsar(object.weatherOptions);
  final _weatherOptions = value10;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _direction);
  writer.writeDateTime(offsets[1], _endTime);
  writer.writeBool(offsets[2], _hasExportedSession);
  writer.writeLong(offsets[3], _roadConditionOptions);
  writer.writeLong(offsets[4], _roadLightingOptions);
  writer.writeLong(offsets[5], _roadZoneOptions);
  writer.writeLong(offsets[6], _speedLimit);
  writer.writeDateTime(offsets[7], _startTime);
  writer.writeBytes(offsets[8], _streetAddress);
  writer.writeStringList(offsets[9], _volunteerNames);
  writer.writeLong(offsets[10], _weatherOptions);
}

SessionCollection _sessionCollectionDeserializeNative(
    IsarCollection<SessionCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = SessionCollection();
  object.direction = _sessionCollectionDirectionConverter
      .fromIsar(reader.readLong(offsets[0]));
  object.endTime = reader.readDateTime(offsets[1]);
  object.hasExportedSession = reader.readBool(offsets[2]);
  object.id = id;
  object.roadConditionOptions = _sessionCollectionRoadConditionConverter
      .fromIsar(reader.readLong(offsets[3]));
  object.roadLightingOptions =
      _sessionCollectionLightingConverter.fromIsar(reader.readLong(offsets[4]));
  object.roadZoneOptions =
      _sessionCollectionRoadZoneConverter.fromIsar(reader.readLong(offsets[5]));
  object.speedLimit = reader.readLong(offsets[6]);
  object.startTime = reader.readDateTime(offsets[7]);
  object.streetAddress = reader.readString(offsets[8]);
  object.volunteerNames = reader.readStringList(offsets[9]) ?? [];
  object.weatherOptions =
      _sessionCollectionWeatherConverter.fromIsar(reader.readLong(offsets[10]));
  return object;
}

P _sessionCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (_sessionCollectionDirectionConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (_sessionCollectionRoadConditionConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 4:
      return (_sessionCollectionLightingConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 5:
      return (_sessionCollectionRoadZoneConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (_sessionCollectionWeatherConverter
          .fromIsar(reader.readLong(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _sessionCollectionSerializeWeb(
    IsarCollection<SessionCollection> collection, SessionCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'direction',
      _sessionCollectionDirectionConverter.toIsar(object.direction));
  IsarNative.jsObjectSet(
      jsObj, 'endTime', object.endTime.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(
      jsObj, 'hasExportedSession', object.hasExportedSession);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(
      jsObj,
      'roadConditionOptions',
      _sessionCollectionRoadConditionConverter
          .toIsar(object.roadConditionOptions));
  IsarNative.jsObjectSet(jsObj, 'roadLightingOptions',
      _sessionCollectionLightingConverter.toIsar(object.roadLightingOptions));
  IsarNative.jsObjectSet(jsObj, 'roadZoneOptions',
      _sessionCollectionRoadZoneConverter.toIsar(object.roadZoneOptions));
  IsarNative.jsObjectSet(jsObj, 'speedLimit', object.speedLimit);
  IsarNative.jsObjectSet(
      jsObj, 'startTime', object.startTime.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'streetAddress', object.streetAddress);
  IsarNative.jsObjectSet(jsObj, 'volunteerNames', object.volunteerNames);
  IsarNative.jsObjectSet(jsObj, 'weatherOptions',
      _sessionCollectionWeatherConverter.toIsar(object.weatherOptions));
  return jsObj;
}

SessionCollection _sessionCollectionDeserializeWeb(
    IsarCollection<SessionCollection> collection, dynamic jsObj) {
  final object = SessionCollection();
  object.direction = _sessionCollectionDirectionConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'direction') ?? double.negativeInfinity);
  object.endTime = IsarNative.jsObjectGet(jsObj, 'endTime') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'endTime'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.hasExportedSession =
      IsarNative.jsObjectGet(jsObj, 'hasExportedSession') ?? false;
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.roadConditionOptions = _sessionCollectionRoadConditionConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'roadConditionOptions') ??
          double.negativeInfinity);
  object.roadLightingOptions = _sessionCollectionLightingConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'roadLightingOptions') ??
          double.negativeInfinity);
  object.roadZoneOptions = _sessionCollectionRoadZoneConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'roadZoneOptions') ??
          double.negativeInfinity);
  object.speedLimit =
      IsarNative.jsObjectGet(jsObj, 'speedLimit') ?? double.negativeInfinity;
  object.startTime = IsarNative.jsObjectGet(jsObj, 'startTime') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'startTime'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.streetAddress = IsarNative.jsObjectGet(jsObj, 'streetAddress') ?? '';
  object.volunteerNames =
      (IsarNative.jsObjectGet(jsObj, 'volunteerNames') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          [];
  object.weatherOptions = _sessionCollectionWeatherConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'weatherOptions') ??
          double.negativeInfinity);
  return object;
}

P _sessionCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'direction':
      return (_sessionCollectionDirectionConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'direction') ??
              double.negativeInfinity)) as P;
    case 'endTime':
      return (IsarNative.jsObjectGet(jsObj, 'endTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'endTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'hasExportedSession':
      return (IsarNative.jsObjectGet(jsObj, 'hasExportedSession') ?? false)
          as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'roadConditionOptions':
      return (_sessionCollectionRoadConditionConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'roadConditionOptions') ??
              double.negativeInfinity)) as P;
    case 'roadLightingOptions':
      return (_sessionCollectionLightingConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'roadLightingOptions') ??
              double.negativeInfinity)) as P;
    case 'roadZoneOptions':
      return (_sessionCollectionRoadZoneConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'roadZoneOptions') ??
              double.negativeInfinity)) as P;
    case 'speedLimit':
      return (IsarNative.jsObjectGet(jsObj, 'speedLimit') ??
          double.negativeInfinity) as P;
    case 'startTime':
      return (IsarNative.jsObjectGet(jsObj, 'startTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'startTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'streetAddress':
      return (IsarNative.jsObjectGet(jsObj, 'streetAddress') ?? '') as P;
    case 'volunteerNames':
      return ((IsarNative.jsObjectGet(jsObj, 'volunteerNames') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'weatherOptions':
      return (_sessionCollectionWeatherConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'weatherOptions') ??
              double.negativeInfinity)) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _sessionCollectionAttachLinks(
    IsarCollection col, int id, SessionCollection object) {}

extension SessionCollectionQueryWhereSort
    on QueryBuilder<SessionCollection, SessionCollection, QWhere> {
  QueryBuilder<SessionCollection, SessionCollection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhere>
      anyStartTime() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'startTime'));
  }
}

extension SessionCollectionQueryWhere
    on QueryBuilder<SessionCollection, SessionCollection, QWhereClause> {
  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
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

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      startTimeEqualTo(DateTime startTime) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'startTime',
      value: [startTime],
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      startTimeNotEqualTo(DateTime startTime) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'startTime',
        upper: [startTime],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'startTime',
        lower: [startTime],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'startTime',
        lower: [startTime],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'startTime',
        upper: [startTime],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      startTimeGreaterThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'startTime',
      lower: [startTime],
      includeLower: include,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      startTimeLessThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'startTime',
      upper: [startTime],
      includeUpper: include,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterWhereClause>
      startTimeBetween(
    DateTime lowerStartTime,
    DateTime upperStartTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'startTime',
      lower: [lowerStartTime],
      includeLower: includeLower,
      upper: [upperStartTime],
      includeUpper: includeUpper,
    ));
  }
}

extension SessionCollectionQueryFilter
    on QueryBuilder<SessionCollection, SessionCollection, QFilterCondition> {
  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      directionEqualTo(Direction value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'direction',
      value: _sessionCollectionDirectionConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      directionGreaterThan(
    Direction value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'direction',
      value: _sessionCollectionDirectionConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      directionLessThan(
    Direction value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'direction',
      value: _sessionCollectionDirectionConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      directionBetween(
    Direction lower,
    Direction upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'direction',
      lower: _sessionCollectionDirectionConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _sessionCollectionDirectionConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      endTimeEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'endTime',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'endTime',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'endTime',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'endTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      hasExportedSessionEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hasExportedSession',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
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

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
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

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
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

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadConditionOptionsEqualTo(RoadCondition value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'roadConditionOptions',
      value: _sessionCollectionRoadConditionConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadConditionOptionsGreaterThan(
    RoadCondition value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'roadConditionOptions',
      value: _sessionCollectionRoadConditionConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadConditionOptionsLessThan(
    RoadCondition value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'roadConditionOptions',
      value: _sessionCollectionRoadConditionConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadConditionOptionsBetween(
    RoadCondition lower,
    RoadCondition upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'roadConditionOptions',
      lower: _sessionCollectionRoadConditionConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _sessionCollectionRoadConditionConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadLightingOptionsEqualTo(RoadLighting value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'roadLightingOptions',
      value: _sessionCollectionLightingConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadLightingOptionsGreaterThan(
    RoadLighting value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'roadLightingOptions',
      value: _sessionCollectionLightingConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadLightingOptionsLessThan(
    RoadLighting value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'roadLightingOptions',
      value: _sessionCollectionLightingConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadLightingOptionsBetween(
    RoadLighting lower,
    RoadLighting upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'roadLightingOptions',
      lower: _sessionCollectionLightingConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _sessionCollectionLightingConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadZoneOptionsEqualTo(RoadZone value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'roadZoneOptions',
      value: _sessionCollectionRoadZoneConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadZoneOptionsGreaterThan(
    RoadZone value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'roadZoneOptions',
      value: _sessionCollectionRoadZoneConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadZoneOptionsLessThan(
    RoadZone value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'roadZoneOptions',
      value: _sessionCollectionRoadZoneConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      roadZoneOptionsBetween(
    RoadZone lower,
    RoadZone upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'roadZoneOptions',
      lower: _sessionCollectionRoadZoneConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _sessionCollectionRoadZoneConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      speedLimitEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'speedLimit',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      speedLimitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'speedLimit',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      speedLimitLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'speedLimit',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      speedLimitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'speedLimit',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'startTime',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'startTime',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'startTime',
      value: value,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'startTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'streetAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'streetAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'streetAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'streetAddress',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'streetAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'streetAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'streetAddress',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      streetAddressMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'streetAddress',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'volunteerNames',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'volunteerNames',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'volunteerNames',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'volunteerNames',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'volunteerNames',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'volunteerNames',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'volunteerNames',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      volunteerNamesAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'volunteerNames',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      weatherOptionsEqualTo(Weather value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'weatherOptions',
      value: _sessionCollectionWeatherConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      weatherOptionsGreaterThan(
    Weather value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'weatherOptions',
      value: _sessionCollectionWeatherConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      weatherOptionsLessThan(
    Weather value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'weatherOptions',
      value: _sessionCollectionWeatherConverter.toIsar(value),
    ));
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterFilterCondition>
      weatherOptionsBetween(
    Weather lower,
    Weather upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'weatherOptions',
      lower: _sessionCollectionWeatherConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _sessionCollectionWeatherConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }
}

extension SessionCollectionQueryLinks
    on QueryBuilder<SessionCollection, SessionCollection, QFilterCondition> {}

extension SessionCollectionQueryWhereSortBy
    on QueryBuilder<SessionCollection, SessionCollection, QSortBy> {
  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByDirection() {
    return addSortByInternal('direction', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByDirectionDesc() {
    return addSortByInternal('direction', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByEndTime() {
    return addSortByInternal('endTime', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByEndTimeDesc() {
    return addSortByInternal('endTime', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByHasExportedSession() {
    return addSortByInternal('hasExportedSession', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByHasExportedSessionDesc() {
    return addSortByInternal('hasExportedSession', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByRoadConditionOptions() {
    return addSortByInternal('roadConditionOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByRoadConditionOptionsDesc() {
    return addSortByInternal('roadConditionOptions', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByRoadLightingOptions() {
    return addSortByInternal('roadLightingOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByRoadLightingOptionsDesc() {
    return addSortByInternal('roadLightingOptions', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByRoadZoneOptions() {
    return addSortByInternal('roadZoneOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByRoadZoneOptionsDesc() {
    return addSortByInternal('roadZoneOptions', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortBySpeedLimit() {
    return addSortByInternal('speedLimit', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortBySpeedLimitDesc() {
    return addSortByInternal('speedLimit', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByStartTime() {
    return addSortByInternal('startTime', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByStartTimeDesc() {
    return addSortByInternal('startTime', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByStreetAddress() {
    return addSortByInternal('streetAddress', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByStreetAddressDesc() {
    return addSortByInternal('streetAddress', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByWeatherOptions() {
    return addSortByInternal('weatherOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      sortByWeatherOptionsDesc() {
    return addSortByInternal('weatherOptions', Sort.desc);
  }
}

extension SessionCollectionQueryWhereSortThenBy
    on QueryBuilder<SessionCollection, SessionCollection, QSortThenBy> {
  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByDirection() {
    return addSortByInternal('direction', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByDirectionDesc() {
    return addSortByInternal('direction', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByEndTime() {
    return addSortByInternal('endTime', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByEndTimeDesc() {
    return addSortByInternal('endTime', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByHasExportedSession() {
    return addSortByInternal('hasExportedSession', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByHasExportedSessionDesc() {
    return addSortByInternal('hasExportedSession', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByRoadConditionOptions() {
    return addSortByInternal('roadConditionOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByRoadConditionOptionsDesc() {
    return addSortByInternal('roadConditionOptions', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByRoadLightingOptions() {
    return addSortByInternal('roadLightingOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByRoadLightingOptionsDesc() {
    return addSortByInternal('roadLightingOptions', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByRoadZoneOptions() {
    return addSortByInternal('roadZoneOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByRoadZoneOptionsDesc() {
    return addSortByInternal('roadZoneOptions', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenBySpeedLimit() {
    return addSortByInternal('speedLimit', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenBySpeedLimitDesc() {
    return addSortByInternal('speedLimit', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByStartTime() {
    return addSortByInternal('startTime', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByStartTimeDesc() {
    return addSortByInternal('startTime', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByStreetAddress() {
    return addSortByInternal('streetAddress', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByStreetAddressDesc() {
    return addSortByInternal('streetAddress', Sort.desc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByWeatherOptions() {
    return addSortByInternal('weatherOptions', Sort.asc);
  }

  QueryBuilder<SessionCollection, SessionCollection, QAfterSortBy>
      thenByWeatherOptionsDesc() {
    return addSortByInternal('weatherOptions', Sort.desc);
  }
}

extension SessionCollectionQueryWhereDistinct
    on QueryBuilder<SessionCollection, SessionCollection, QDistinct> {
  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByDirection() {
    return addDistinctByInternal('direction');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByEndTime() {
    return addDistinctByInternal('endTime');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByHasExportedSession() {
    return addDistinctByInternal('hasExportedSession');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByRoadConditionOptions() {
    return addDistinctByInternal('roadConditionOptions');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByRoadLightingOptions() {
    return addDistinctByInternal('roadLightingOptions');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByRoadZoneOptions() {
    return addDistinctByInternal('roadZoneOptions');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctBySpeedLimit() {
    return addDistinctByInternal('speedLimit');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByStartTime() {
    return addDistinctByInternal('startTime');
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByStreetAddress({bool caseSensitive = true}) {
    return addDistinctByInternal('streetAddress', caseSensitive: caseSensitive);
  }

  QueryBuilder<SessionCollection, SessionCollection, QDistinct>
      distinctByWeatherOptions() {
    return addDistinctByInternal('weatherOptions');
  }
}

extension SessionCollectionQueryProperty
    on QueryBuilder<SessionCollection, SessionCollection, QQueryProperty> {
  QueryBuilder<SessionCollection, Direction, QQueryOperations>
      directionProperty() {
    return addPropertyNameInternal('direction');
  }

  QueryBuilder<SessionCollection, DateTime, QQueryOperations>
      endTimeProperty() {
    return addPropertyNameInternal('endTime');
  }

  QueryBuilder<SessionCollection, bool, QQueryOperations>
      hasExportedSessionProperty() {
    return addPropertyNameInternal('hasExportedSession');
  }

  QueryBuilder<SessionCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SessionCollection, RoadCondition, QQueryOperations>
      roadConditionOptionsProperty() {
    return addPropertyNameInternal('roadConditionOptions');
  }

  QueryBuilder<SessionCollection, RoadLighting, QQueryOperations>
      roadLightingOptionsProperty() {
    return addPropertyNameInternal('roadLightingOptions');
  }

  QueryBuilder<SessionCollection, RoadZone, QQueryOperations>
      roadZoneOptionsProperty() {
    return addPropertyNameInternal('roadZoneOptions');
  }

  QueryBuilder<SessionCollection, int, QQueryOperations> speedLimitProperty() {
    return addPropertyNameInternal('speedLimit');
  }

  QueryBuilder<SessionCollection, DateTime, QQueryOperations>
      startTimeProperty() {
    return addPropertyNameInternal('startTime');
  }

  QueryBuilder<SessionCollection, String, QQueryOperations>
      streetAddressProperty() {
    return addPropertyNameInternal('streetAddress');
  }

  QueryBuilder<SessionCollection, List<String>, QQueryOperations>
      volunteerNamesProperty() {
    return addPropertyNameInternal('volunteerNames');
  }

  QueryBuilder<SessionCollection, Weather, QQueryOperations>
      weatherOptionsProperty() {
    return addPropertyNameInternal('weatherOptions');
  }
}
