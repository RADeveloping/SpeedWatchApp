// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetSettingsCollectionCollection on Isar {
  IsarCollection<SettingsCollection> get settingsCollections => getCollection();
}

const SettingsCollectionSchema = CollectionSchema(
  name: 'SettingsCollection',
  schema:
      '{"name":"SettingsCollection","idName":"id","properties":[{"name":"key","type":"String"},{"name":"value","type":"StringList"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'key': 0, 'value': 1},
  listProperties: {'value'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _settingsCollectionGetId,
  setId: _settingsCollectionSetId,
  getLinks: _settingsCollectionGetLinks,
  attachLinks: _settingsCollectionAttachLinks,
  serializeNative: _settingsCollectionSerializeNative,
  deserializeNative: _settingsCollectionDeserializeNative,
  deserializePropNative: _settingsCollectionDeserializePropNative,
  serializeWeb: _settingsCollectionSerializeWeb,
  deserializeWeb: _settingsCollectionDeserializeWeb,
  deserializePropWeb: _settingsCollectionDeserializePropWeb,
  version: 3,
);

int? _settingsCollectionGetId(SettingsCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _settingsCollectionSetId(SettingsCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase> _settingsCollectionGetLinks(SettingsCollection object) {
  return [];
}

void _settingsCollectionSerializeNative(
    IsarCollection<SettingsCollection> collection,
    IsarRawObject rawObj,
    SettingsCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.key;
  final _key = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_key.length) as int;
  final value1 = object.value;
  dynamicSize += (value1.length) * 8;
  final bytesList1 = <IsarUint8List>[];
  for (var str in value1) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList1.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _value = bytesList1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _key);
  writer.writeStringList(offsets[1], _value);
}

SettingsCollection _settingsCollectionDeserializeNative(
    IsarCollection<SettingsCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = SettingsCollection();
  object.id = id;
  object.key = reader.readString(offsets[0]);
  object.value = reader.readStringList(offsets[1]) ?? [];
  return object;
}

P _settingsCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _settingsCollectionSerializeWeb(
    IsarCollection<SettingsCollection> collection, SettingsCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'value', object.value);
  return jsObj;
}

SettingsCollection _settingsCollectionDeserializeWeb(
    IsarCollection<SettingsCollection> collection, dynamic jsObj) {
  final object = SettingsCollection();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.key = IsarNative.jsObjectGet(jsObj, 'key') ?? '';
  object.value = (IsarNative.jsObjectGet(jsObj, 'value') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  return object;
}

P _settingsCollectionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
    case 'value':
      return ((IsarNative.jsObjectGet(jsObj, 'value') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _settingsCollectionAttachLinks(
    IsarCollection col, int id, SettingsCollection object) {}

extension SettingsCollectionQueryWhereSort
    on QueryBuilder<SettingsCollection, SettingsCollection, QWhere> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension SettingsCollectionQueryWhere
    on QueryBuilder<SettingsCollection, SettingsCollection, QWhereClause> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
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
}

extension SettingsCollectionQueryFilter
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'value',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'value',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueAnyMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'value',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SettingsCollectionQueryLinks
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {}

extension SettingsCollectionQueryWhereSortBy
    on QueryBuilder<SettingsCollection, SettingsCollection, QSortBy> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }
}

extension SettingsCollectionQueryWhereSortThenBy
    on QueryBuilder<SettingsCollection, SettingsCollection, QSortThenBy> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }
}

extension SettingsCollectionQueryWhereDistinct
    on QueryBuilder<SettingsCollection, SettingsCollection, QDistinct> {
  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }
}

extension SettingsCollectionQueryProperty
    on QueryBuilder<SettingsCollection, SettingsCollection, QQueryProperty> {
  QueryBuilder<SettingsCollection, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<SettingsCollection, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<SettingsCollection, List<String>, QQueryOperations>
      valueProperty() {
    return addPropertyNameInternal('value');
  }
}
