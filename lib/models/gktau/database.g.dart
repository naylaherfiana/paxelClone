// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ItemTypeTable extends ItemType with TableInfo<$ItemTypeTable, ItemType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_type';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemType(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ItemTypeTable createAlias(String alias) {
    return $ItemTypeTable(attachedDatabase, alias);
  }
}

class ItemType extends DataClass implements Insertable<ItemType> {
  final int id;
  final String name;
  final String? description;
  const ItemType({required this.id, required this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ItemTypeCompanion toCompanion(bool nullToAbsent) {
    return ItemTypeCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
    );
  }

  factory ItemType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  ItemType copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => ItemType(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  ItemType copyWithCompanion(ItemTypeCompanion data) {
    return ItemType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemType &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class ItemTypeCompanion extends UpdateCompanion<ItemType> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  const ItemTypeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  ItemTypeCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ItemType> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  ItemTypeCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
  }) {
    return ItemTypeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTypeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $PackageSizeTable extends PackageSize
    with TableInfo<$PackageSizeTable, PackageSize> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PackageSizeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dimensionMeta = const VerificationMeta(
    'dimension',
  );
  @override
  late final GeneratedColumn<double> dimension = GeneratedColumn<double>(
    'dimension',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeTypeMeta = const VerificationMeta(
    'sizeType',
  );
  @override
  late final GeneratedColumn<String> sizeType = GeneratedColumn<String>(
    'size_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    dimension,
    weight,
    description,
    sizeType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'package_size';
  @override
  VerificationContext validateIntegrity(
    Insertable<PackageSize> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dimension')) {
      context.handle(
        _dimensionMeta,
        dimension.isAcceptableOrUnknown(data['dimension']!, _dimensionMeta),
      );
    } else if (isInserting) {
      context.missing(_dimensionMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('size_type')) {
      context.handle(
        _sizeTypeMeta,
        sizeType.isAcceptableOrUnknown(data['size_type']!, _sizeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PackageSize map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PackageSize(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      dimension:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}dimension'],
          )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sizeType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}size_type'],
          )!,
    );
  }

  @override
  $PackageSizeTable createAlias(String alias) {
    return $PackageSizeTable(attachedDatabase, alias);
  }
}

class PackageSize extends DataClass implements Insertable<PackageSize> {
  final int id;
  final String name;
  final double dimension;
  final double? weight;
  final String? description;
  final String sizeType;
  const PackageSize({
    required this.id,
    required this.name,
    required this.dimension,
    this.weight,
    this.description,
    required this.sizeType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['dimension'] = Variable<double>(dimension);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['size_type'] = Variable<String>(sizeType);
    return map;
  }

  PackageSizeCompanion toCompanion(bool nullToAbsent) {
    return PackageSizeCompanion(
      id: Value(id),
      name: Value(name),
      dimension: Value(dimension),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      sizeType: Value(sizeType),
    );
  }

  factory PackageSize.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PackageSize(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dimension: serializer.fromJson<double>(json['dimension']),
      weight: serializer.fromJson<double?>(json['weight']),
      description: serializer.fromJson<String?>(json['description']),
      sizeType: serializer.fromJson<String>(json['sizeType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dimension': serializer.toJson<double>(dimension),
      'weight': serializer.toJson<double?>(weight),
      'description': serializer.toJson<String?>(description),
      'sizeType': serializer.toJson<String>(sizeType),
    };
  }

  PackageSize copyWith({
    int? id,
    String? name,
    double? dimension,
    Value<double?> weight = const Value.absent(),
    Value<String?> description = const Value.absent(),
    String? sizeType,
  }) => PackageSize(
    id: id ?? this.id,
    name: name ?? this.name,
    dimension: dimension ?? this.dimension,
    weight: weight.present ? weight.value : this.weight,
    description: description.present ? description.value : this.description,
    sizeType: sizeType ?? this.sizeType,
  );
  PackageSize copyWithCompanion(PackageSizeCompanion data) {
    return PackageSize(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dimension: data.dimension.present ? data.dimension.value : this.dimension,
      weight: data.weight.present ? data.weight.value : this.weight,
      description:
          data.description.present ? data.description.value : this.description,
      sizeType: data.sizeType.present ? data.sizeType.value : this.sizeType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PackageSize(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dimension: $dimension, ')
          ..write('weight: $weight, ')
          ..write('description: $description, ')
          ..write('sizeType: $sizeType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, dimension, weight, description, sizeType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PackageSize &&
          other.id == this.id &&
          other.name == this.name &&
          other.dimension == this.dimension &&
          other.weight == this.weight &&
          other.description == this.description &&
          other.sizeType == this.sizeType);
}

class PackageSizeCompanion extends UpdateCompanion<PackageSize> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> dimension;
  final Value<double?> weight;
  final Value<String?> description;
  final Value<String> sizeType;
  const PackageSizeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dimension = const Value.absent(),
    this.weight = const Value.absent(),
    this.description = const Value.absent(),
    this.sizeType = const Value.absent(),
  });
  PackageSizeCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double dimension,
    this.weight = const Value.absent(),
    this.description = const Value.absent(),
    required String sizeType,
  }) : name = Value(name),
       dimension = Value(dimension),
       sizeType = Value(sizeType);
  static Insertable<PackageSize> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? dimension,
    Expression<double>? weight,
    Expression<String>? description,
    Expression<String>? sizeType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dimension != null) 'dimension': dimension,
      if (weight != null) 'weight': weight,
      if (description != null) 'description': description,
      if (sizeType != null) 'size_type': sizeType,
    });
  }

  PackageSizeCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? dimension,
    Value<double?>? weight,
    Value<String?>? description,
    Value<String>? sizeType,
  }) {
    return PackageSizeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dimension: dimension ?? this.dimension,
      weight: weight ?? this.weight,
      description: description ?? this.description,
      sizeType: sizeType ?? this.sizeType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dimension.present) {
      map['dimension'] = Variable<double>(dimension.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sizeType.present) {
      map['size_type'] = Variable<String>(sizeType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackageSizeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dimension: $dimension, ')
          ..write('weight: $weight, ')
          ..write('description: $description, ')
          ..write('sizeType: $sizeType')
          ..write(')'))
        .toString();
  }
}

class $ServiceTable extends Service with TableInfo<$ServiceTable, Service> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service';
  @override
  VerificationContext validateIntegrity(
    Insertable<Service> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Service map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Service(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ServiceTable createAlias(String alias) {
    return $ServiceTable(attachedDatabase, alias);
  }
}

class Service extends DataClass implements Insertable<Service> {
  final int id;
  final String name;
  final String? description;
  const Service({required this.id, required this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ServiceCompanion toCompanion(bool nullToAbsent) {
    return ServiceCompanion(
      id: Value(id),
      name: Value(name),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
    );
  }

  factory Service.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Service(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  Service copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => Service(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  Service copyWithCompanion(ServiceCompanion data) {
    return Service(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Service(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Service &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class ServiceCompanion extends UpdateCompanion<Service> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  const ServiceCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  ServiceCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Service> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  ServiceCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
  }) {
    return ServiceCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $ServicePriceTable extends ServicePrice
    with TableInfo<$ServicePriceTable, ServicePrice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServicePriceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serviceIdMeta = const VerificationMeta(
    'serviceId',
  );
  @override
  late final GeneratedColumn<int> serviceId = GeneratedColumn<int>(
    'service_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packageSizeIdMeta = const VerificationMeta(
    'packageSizeId',
  );
  @override
  late final GeneratedColumn<int> packageSizeId = GeneratedColumn<int>(
    'package_size_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, serviceId, packageSizeId, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_price';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServicePrice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_id')) {
      context.handle(
        _serviceIdMeta,
        serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('package_size_id')) {
      context.handle(
        _packageSizeIdMeta,
        packageSizeId.isAcceptableOrUnknown(
          data['package_size_id']!,
          _packageSizeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageSizeIdMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServicePrice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServicePrice(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      serviceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}service_id'],
          )!,
      packageSizeId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}package_size_id'],
          )!,
      price:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}price'],
          )!,
    );
  }

  @override
  $ServicePriceTable createAlias(String alias) {
    return $ServicePriceTable(attachedDatabase, alias);
  }
}

class ServicePrice extends DataClass implements Insertable<ServicePrice> {
  final int id;
  final int serviceId;
  final int packageSizeId;
  final double price;
  const ServicePrice({
    required this.id,
    required this.serviceId,
    required this.packageSizeId,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['service_id'] = Variable<int>(serviceId);
    map['package_size_id'] = Variable<int>(packageSizeId);
    map['price'] = Variable<double>(price);
    return map;
  }

  ServicePriceCompanion toCompanion(bool nullToAbsent) {
    return ServicePriceCompanion(
      id: Value(id),
      serviceId: Value(serviceId),
      packageSizeId: Value(packageSizeId),
      price: Value(price),
    );
  }

  factory ServicePrice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServicePrice(
      id: serializer.fromJson<int>(json['id']),
      serviceId: serializer.fromJson<int>(json['serviceId']),
      packageSizeId: serializer.fromJson<int>(json['packageSizeId']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceId': serializer.toJson<int>(serviceId),
      'packageSizeId': serializer.toJson<int>(packageSizeId),
      'price': serializer.toJson<double>(price),
    };
  }

  ServicePrice copyWith({
    int? id,
    int? serviceId,
    int? packageSizeId,
    double? price,
  }) => ServicePrice(
    id: id ?? this.id,
    serviceId: serviceId ?? this.serviceId,
    packageSizeId: packageSizeId ?? this.packageSizeId,
    price: price ?? this.price,
  );
  ServicePrice copyWithCompanion(ServicePriceCompanion data) {
    return ServicePrice(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      packageSizeId:
          data.packageSizeId.present
              ? data.packageSizeId.value
              : this.packageSizeId,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServicePrice(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('packageSizeId: $packageSizeId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serviceId, packageSizeId, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServicePrice &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.packageSizeId == this.packageSizeId &&
          other.price == this.price);
}

class ServicePriceCompanion extends UpdateCompanion<ServicePrice> {
  final Value<int> id;
  final Value<int> serviceId;
  final Value<int> packageSizeId;
  final Value<double> price;
  const ServicePriceCompanion({
    this.id = const Value.absent(),
    this.serviceId = const Value.absent(),
    this.packageSizeId = const Value.absent(),
    this.price = const Value.absent(),
  });
  ServicePriceCompanion.insert({
    this.id = const Value.absent(),
    required int serviceId,
    required int packageSizeId,
    required double price,
  }) : serviceId = Value(serviceId),
       packageSizeId = Value(packageSizeId),
       price = Value(price);
  static Insertable<ServicePrice> custom({
    Expression<int>? id,
    Expression<int>? serviceId,
    Expression<int>? packageSizeId,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (packageSizeId != null) 'package_size_id': packageSizeId,
      if (price != null) 'price': price,
    });
  }

  ServicePriceCompanion copyWith({
    Value<int>? id,
    Value<int>? serviceId,
    Value<int>? packageSizeId,
    Value<double>? price,
  }) {
    return ServicePriceCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      packageSizeId: packageSizeId ?? this.packageSizeId,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = Variable<int>(serviceId.value);
    }
    if (packageSizeId.present) {
      map['package_size_id'] = Variable<int>(packageSizeId.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServicePriceCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('packageSizeId: $packageSizeId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $OrderTable extends Order with TableInfo<$OrderTable, OrderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _senderNameMeta = const VerificationMeta(
    'senderName',
  );
  @override
  late final GeneratedColumn<String> senderName = GeneratedColumn<String>(
    'sender_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderPhoneMeta = const VerificationMeta(
    'senderPhone',
  );
  @override
  late final GeneratedColumn<String> senderPhone = GeneratedColumn<String>(
    'sender_phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _senderAddressMeta = const VerificationMeta(
    'senderAddress',
  );
  @override
  late final GeneratedColumn<String> senderAddress = GeneratedColumn<String>(
    'sender_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipientNameMeta = const VerificationMeta(
    'recipientName',
  );
  @override
  late final GeneratedColumn<String> recipientName = GeneratedColumn<String>(
    'recipient_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipientPhoneMeta = const VerificationMeta(
    'recipientPhone',
  );
  @override
  late final GeneratedColumn<String> recipientPhone = GeneratedColumn<String>(
    'recipient_phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipientAddressMeta = const VerificationMeta(
    'recipientAddress',
  );
  @override
  late final GeneratedColumn<String> recipientAddress = GeneratedColumn<String>(
    'recipient_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packageSizeIdMeta = const VerificationMeta(
    'packageSizeId',
  );
  @override
  late final GeneratedColumn<int> packageSizeId = GeneratedColumn<int>(
    'package_size_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemTypeIdMeta = const VerificationMeta(
    'itemTypeId',
  );
  @override
  late final GeneratedColumn<int> itemTypeId = GeneratedColumn<int>(
    'item_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serviceIdMeta = const VerificationMeta(
    'serviceId',
  );
  @override
  late final GeneratedColumn<int> serviceId = GeneratedColumn<int>(
    'service_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servicePriceIdMeta = const VerificationMeta(
    'servicePriceId',
  );
  @override
  late final GeneratedColumn<int> servicePriceId = GeneratedColumn<int>(
    'service_price_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalPaymentMeta = const VerificationMeta(
    'totalPayment',
  );
  @override
  late final GeneratedColumn<int> totalPayment = GeneratedColumn<int>(
    'total_payment',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    senderName,
    senderPhone,
    senderAddress,
    recipientName,
    recipientPhone,
    recipientAddress,
    packageSizeId,
    itemTypeId,
    serviceId,
    servicePriceId,
    totalPayment,
    paymentMethod,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sender_name')) {
      context.handle(
        _senderNameMeta,
        senderName.isAcceptableOrUnknown(data['sender_name']!, _senderNameMeta),
      );
    } else if (isInserting) {
      context.missing(_senderNameMeta);
    }
    if (data.containsKey('sender_phone')) {
      context.handle(
        _senderPhoneMeta,
        senderPhone.isAcceptableOrUnknown(
          data['sender_phone']!,
          _senderPhoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_senderPhoneMeta);
    }
    if (data.containsKey('sender_address')) {
      context.handle(
        _senderAddressMeta,
        senderAddress.isAcceptableOrUnknown(
          data['sender_address']!,
          _senderAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_senderAddressMeta);
    }
    if (data.containsKey('recipient_name')) {
      context.handle(
        _recipientNameMeta,
        recipientName.isAcceptableOrUnknown(
          data['recipient_name']!,
          _recipientNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipientNameMeta);
    }
    if (data.containsKey('recipient_phone')) {
      context.handle(
        _recipientPhoneMeta,
        recipientPhone.isAcceptableOrUnknown(
          data['recipient_phone']!,
          _recipientPhoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipientPhoneMeta);
    }
    if (data.containsKey('recipient_address')) {
      context.handle(
        _recipientAddressMeta,
        recipientAddress.isAcceptableOrUnknown(
          data['recipient_address']!,
          _recipientAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipientAddressMeta);
    }
    if (data.containsKey('package_size_id')) {
      context.handle(
        _packageSizeIdMeta,
        packageSizeId.isAcceptableOrUnknown(
          data['package_size_id']!,
          _packageSizeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageSizeIdMeta);
    }
    if (data.containsKey('item_type_id')) {
      context.handle(
        _itemTypeIdMeta,
        itemTypeId.isAcceptableOrUnknown(
          data['item_type_id']!,
          _itemTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itemTypeIdMeta);
    }
    if (data.containsKey('service_id')) {
      context.handle(
        _serviceIdMeta,
        serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('service_price_id')) {
      context.handle(
        _servicePriceIdMeta,
        servicePriceId.isAcceptableOrUnknown(
          data['service_price_id']!,
          _servicePriceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_servicePriceIdMeta);
    }
    if (data.containsKey('total_payment')) {
      context.handle(
        _totalPaymentMeta,
        totalPayment.isAcceptableOrUnknown(
          data['total_payment']!,
          _totalPaymentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalPaymentMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      senderName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sender_name'],
          )!,
      senderPhone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sender_phone'],
          )!,
      senderAddress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sender_address'],
          )!,
      recipientName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}recipient_name'],
          )!,
      recipientPhone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}recipient_phone'],
          )!,
      recipientAddress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}recipient_address'],
          )!,
      packageSizeId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}package_size_id'],
          )!,
      itemTypeId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}item_type_id'],
          )!,
      serviceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}service_id'],
          )!,
      servicePriceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}service_price_id'],
          )!,
      totalPayment:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}total_payment'],
          )!,
      paymentMethod:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}payment_method'],
          )!,
    );
  }

  @override
  $OrderTable createAlias(String alias) {
    return $OrderTable(attachedDatabase, alias);
  }
}

class OrderData extends DataClass implements Insertable<OrderData> {
  final int id;
  final String senderName;
  final String senderPhone;
  final String senderAddress;
  final String recipientName;
  final String recipientPhone;
  final String recipientAddress;
  final int packageSizeId;
  final int itemTypeId;
  final int serviceId;
  final int servicePriceId;
  final int totalPayment;
  final String paymentMethod;
  const OrderData({
    required this.id,
    required this.senderName,
    required this.senderPhone,
    required this.senderAddress,
    required this.recipientName,
    required this.recipientPhone,
    required this.recipientAddress,
    required this.packageSizeId,
    required this.itemTypeId,
    required this.serviceId,
    required this.servicePriceId,
    required this.totalPayment,
    required this.paymentMethod,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sender_name'] = Variable<String>(senderName);
    map['sender_phone'] = Variable<String>(senderPhone);
    map['sender_address'] = Variable<String>(senderAddress);
    map['recipient_name'] = Variable<String>(recipientName);
    map['recipient_phone'] = Variable<String>(recipientPhone);
    map['recipient_address'] = Variable<String>(recipientAddress);
    map['package_size_id'] = Variable<int>(packageSizeId);
    map['item_type_id'] = Variable<int>(itemTypeId);
    map['service_id'] = Variable<int>(serviceId);
    map['service_price_id'] = Variable<int>(servicePriceId);
    map['total_payment'] = Variable<int>(totalPayment);
    map['payment_method'] = Variable<String>(paymentMethod);
    return map;
  }

  OrderCompanion toCompanion(bool nullToAbsent) {
    return OrderCompanion(
      id: Value(id),
      senderName: Value(senderName),
      senderPhone: Value(senderPhone),
      senderAddress: Value(senderAddress),
      recipientName: Value(recipientName),
      recipientPhone: Value(recipientPhone),
      recipientAddress: Value(recipientAddress),
      packageSizeId: Value(packageSizeId),
      itemTypeId: Value(itemTypeId),
      serviceId: Value(serviceId),
      servicePriceId: Value(servicePriceId),
      totalPayment: Value(totalPayment),
      paymentMethod: Value(paymentMethod),
    );
  }

  factory OrderData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderData(
      id: serializer.fromJson<int>(json['id']),
      senderName: serializer.fromJson<String>(json['senderName']),
      senderPhone: serializer.fromJson<String>(json['senderPhone']),
      senderAddress: serializer.fromJson<String>(json['senderAddress']),
      recipientName: serializer.fromJson<String>(json['recipientName']),
      recipientPhone: serializer.fromJson<String>(json['recipientPhone']),
      recipientAddress: serializer.fromJson<String>(json['recipientAddress']),
      packageSizeId: serializer.fromJson<int>(json['packageSizeId']),
      itemTypeId: serializer.fromJson<int>(json['itemTypeId']),
      serviceId: serializer.fromJson<int>(json['serviceId']),
      servicePriceId: serializer.fromJson<int>(json['servicePriceId']),
      totalPayment: serializer.fromJson<int>(json['totalPayment']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'senderName': serializer.toJson<String>(senderName),
      'senderPhone': serializer.toJson<String>(senderPhone),
      'senderAddress': serializer.toJson<String>(senderAddress),
      'recipientName': serializer.toJson<String>(recipientName),
      'recipientPhone': serializer.toJson<String>(recipientPhone),
      'recipientAddress': serializer.toJson<String>(recipientAddress),
      'packageSizeId': serializer.toJson<int>(packageSizeId),
      'itemTypeId': serializer.toJson<int>(itemTypeId),
      'serviceId': serializer.toJson<int>(serviceId),
      'servicePriceId': serializer.toJson<int>(servicePriceId),
      'totalPayment': serializer.toJson<int>(totalPayment),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
    };
  }

  OrderData copyWith({
    int? id,
    String? senderName,
    String? senderPhone,
    String? senderAddress,
    String? recipientName,
    String? recipientPhone,
    String? recipientAddress,
    int? packageSizeId,
    int? itemTypeId,
    int? serviceId,
    int? servicePriceId,
    int? totalPayment,
    String? paymentMethod,
  }) => OrderData(
    id: id ?? this.id,
    senderName: senderName ?? this.senderName,
    senderPhone: senderPhone ?? this.senderPhone,
    senderAddress: senderAddress ?? this.senderAddress,
    recipientName: recipientName ?? this.recipientName,
    recipientPhone: recipientPhone ?? this.recipientPhone,
    recipientAddress: recipientAddress ?? this.recipientAddress,
    packageSizeId: packageSizeId ?? this.packageSizeId,
    itemTypeId: itemTypeId ?? this.itemTypeId,
    serviceId: serviceId ?? this.serviceId,
    servicePriceId: servicePriceId ?? this.servicePriceId,
    totalPayment: totalPayment ?? this.totalPayment,
    paymentMethod: paymentMethod ?? this.paymentMethod,
  );
  OrderData copyWithCompanion(OrderCompanion data) {
    return OrderData(
      id: data.id.present ? data.id.value : this.id,
      senderName:
          data.senderName.present ? data.senderName.value : this.senderName,
      senderPhone:
          data.senderPhone.present ? data.senderPhone.value : this.senderPhone,
      senderAddress:
          data.senderAddress.present
              ? data.senderAddress.value
              : this.senderAddress,
      recipientName:
          data.recipientName.present
              ? data.recipientName.value
              : this.recipientName,
      recipientPhone:
          data.recipientPhone.present
              ? data.recipientPhone.value
              : this.recipientPhone,
      recipientAddress:
          data.recipientAddress.present
              ? data.recipientAddress.value
              : this.recipientAddress,
      packageSizeId:
          data.packageSizeId.present
              ? data.packageSizeId.value
              : this.packageSizeId,
      itemTypeId:
          data.itemTypeId.present ? data.itemTypeId.value : this.itemTypeId,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      servicePriceId:
          data.servicePriceId.present
              ? data.servicePriceId.value
              : this.servicePriceId,
      totalPayment:
          data.totalPayment.present
              ? data.totalPayment.value
              : this.totalPayment,
      paymentMethod:
          data.paymentMethod.present
              ? data.paymentMethod.value
              : this.paymentMethod,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderData(')
          ..write('id: $id, ')
          ..write('senderName: $senderName, ')
          ..write('senderPhone: $senderPhone, ')
          ..write('senderAddress: $senderAddress, ')
          ..write('recipientName: $recipientName, ')
          ..write('recipientPhone: $recipientPhone, ')
          ..write('recipientAddress: $recipientAddress, ')
          ..write('packageSizeId: $packageSizeId, ')
          ..write('itemTypeId: $itemTypeId, ')
          ..write('serviceId: $serviceId, ')
          ..write('servicePriceId: $servicePriceId, ')
          ..write('totalPayment: $totalPayment, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    senderName,
    senderPhone,
    senderAddress,
    recipientName,
    recipientPhone,
    recipientAddress,
    packageSizeId,
    itemTypeId,
    serviceId,
    servicePriceId,
    totalPayment,
    paymentMethod,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderData &&
          other.id == this.id &&
          other.senderName == this.senderName &&
          other.senderPhone == this.senderPhone &&
          other.senderAddress == this.senderAddress &&
          other.recipientName == this.recipientName &&
          other.recipientPhone == this.recipientPhone &&
          other.recipientAddress == this.recipientAddress &&
          other.packageSizeId == this.packageSizeId &&
          other.itemTypeId == this.itemTypeId &&
          other.serviceId == this.serviceId &&
          other.servicePriceId == this.servicePriceId &&
          other.totalPayment == this.totalPayment &&
          other.paymentMethod == this.paymentMethod);
}

class OrderCompanion extends UpdateCompanion<OrderData> {
  final Value<int> id;
  final Value<String> senderName;
  final Value<String> senderPhone;
  final Value<String> senderAddress;
  final Value<String> recipientName;
  final Value<String> recipientPhone;
  final Value<String> recipientAddress;
  final Value<int> packageSizeId;
  final Value<int> itemTypeId;
  final Value<int> serviceId;
  final Value<int> servicePriceId;
  final Value<int> totalPayment;
  final Value<String> paymentMethod;
  const OrderCompanion({
    this.id = const Value.absent(),
    this.senderName = const Value.absent(),
    this.senderPhone = const Value.absent(),
    this.senderAddress = const Value.absent(),
    this.recipientName = const Value.absent(),
    this.recipientPhone = const Value.absent(),
    this.recipientAddress = const Value.absent(),
    this.packageSizeId = const Value.absent(),
    this.itemTypeId = const Value.absent(),
    this.serviceId = const Value.absent(),
    this.servicePriceId = const Value.absent(),
    this.totalPayment = const Value.absent(),
    this.paymentMethod = const Value.absent(),
  });
  OrderCompanion.insert({
    this.id = const Value.absent(),
    required String senderName,
    required String senderPhone,
    required String senderAddress,
    required String recipientName,
    required String recipientPhone,
    required String recipientAddress,
    required int packageSizeId,
    required int itemTypeId,
    required int serviceId,
    required int servicePriceId,
    required int totalPayment,
    required String paymentMethod,
  }) : senderName = Value(senderName),
       senderPhone = Value(senderPhone),
       senderAddress = Value(senderAddress),
       recipientName = Value(recipientName),
       recipientPhone = Value(recipientPhone),
       recipientAddress = Value(recipientAddress),
       packageSizeId = Value(packageSizeId),
       itemTypeId = Value(itemTypeId),
       serviceId = Value(serviceId),
       servicePriceId = Value(servicePriceId),
       totalPayment = Value(totalPayment),
       paymentMethod = Value(paymentMethod);
  static Insertable<OrderData> custom({
    Expression<int>? id,
    Expression<String>? senderName,
    Expression<String>? senderPhone,
    Expression<String>? senderAddress,
    Expression<String>? recipientName,
    Expression<String>? recipientPhone,
    Expression<String>? recipientAddress,
    Expression<int>? packageSizeId,
    Expression<int>? itemTypeId,
    Expression<int>? serviceId,
    Expression<int>? servicePriceId,
    Expression<int>? totalPayment,
    Expression<String>? paymentMethod,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (senderName != null) 'sender_name': senderName,
      if (senderPhone != null) 'sender_phone': senderPhone,
      if (senderAddress != null) 'sender_address': senderAddress,
      if (recipientName != null) 'recipient_name': recipientName,
      if (recipientPhone != null) 'recipient_phone': recipientPhone,
      if (recipientAddress != null) 'recipient_address': recipientAddress,
      if (packageSizeId != null) 'package_size_id': packageSizeId,
      if (itemTypeId != null) 'item_type_id': itemTypeId,
      if (serviceId != null) 'service_id': serviceId,
      if (servicePriceId != null) 'service_price_id': servicePriceId,
      if (totalPayment != null) 'total_payment': totalPayment,
      if (paymentMethod != null) 'payment_method': paymentMethod,
    });
  }

  OrderCompanion copyWith({
    Value<int>? id,
    Value<String>? senderName,
    Value<String>? senderPhone,
    Value<String>? senderAddress,
    Value<String>? recipientName,
    Value<String>? recipientPhone,
    Value<String>? recipientAddress,
    Value<int>? packageSizeId,
    Value<int>? itemTypeId,
    Value<int>? serviceId,
    Value<int>? servicePriceId,
    Value<int>? totalPayment,
    Value<String>? paymentMethod,
  }) {
    return OrderCompanion(
      id: id ?? this.id,
      senderName: senderName ?? this.senderName,
      senderPhone: senderPhone ?? this.senderPhone,
      senderAddress: senderAddress ?? this.senderAddress,
      recipientName: recipientName ?? this.recipientName,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      packageSizeId: packageSizeId ?? this.packageSizeId,
      itemTypeId: itemTypeId ?? this.itemTypeId,
      serviceId: serviceId ?? this.serviceId,
      servicePriceId: servicePriceId ?? this.servicePriceId,
      totalPayment: totalPayment ?? this.totalPayment,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (senderName.present) {
      map['sender_name'] = Variable<String>(senderName.value);
    }
    if (senderPhone.present) {
      map['sender_phone'] = Variable<String>(senderPhone.value);
    }
    if (senderAddress.present) {
      map['sender_address'] = Variable<String>(senderAddress.value);
    }
    if (recipientName.present) {
      map['recipient_name'] = Variable<String>(recipientName.value);
    }
    if (recipientPhone.present) {
      map['recipient_phone'] = Variable<String>(recipientPhone.value);
    }
    if (recipientAddress.present) {
      map['recipient_address'] = Variable<String>(recipientAddress.value);
    }
    if (packageSizeId.present) {
      map['package_size_id'] = Variable<int>(packageSizeId.value);
    }
    if (itemTypeId.present) {
      map['item_type_id'] = Variable<int>(itemTypeId.value);
    }
    if (serviceId.present) {
      map['service_id'] = Variable<int>(serviceId.value);
    }
    if (servicePriceId.present) {
      map['service_price_id'] = Variable<int>(servicePriceId.value);
    }
    if (totalPayment.present) {
      map['total_payment'] = Variable<int>(totalPayment.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderCompanion(')
          ..write('id: $id, ')
          ..write('senderName: $senderName, ')
          ..write('senderPhone: $senderPhone, ')
          ..write('senderAddress: $senderAddress, ')
          ..write('recipientName: $recipientName, ')
          ..write('recipientPhone: $recipientPhone, ')
          ..write('recipientAddress: $recipientAddress, ')
          ..write('packageSizeId: $packageSizeId, ')
          ..write('itemTypeId: $itemTypeId, ')
          ..write('serviceId: $serviceId, ')
          ..write('servicePriceId: $servicePriceId, ')
          ..write('totalPayment: $totalPayment, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $ItemTypeTable itemType = $ItemTypeTable(this);
  late final $PackageSizeTable packageSize = $PackageSizeTable(this);
  late final $ServiceTable service = $ServiceTable(this);
  late final $ServicePriceTable servicePrice = $ServicePriceTable(this);
  late final $OrderTable order = $OrderTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    itemType,
    packageSize,
    service,
    servicePrice,
    order,
  ];
}

typedef $$ItemTypeTableCreateCompanionBuilder =
    ItemTypeCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
    });
typedef $$ItemTypeTableUpdateCompanionBuilder =
    ItemTypeCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
    });

class $$ItemTypeTableFilterComposer extends Composer<_$AppDb, $ItemTypeTable> {
  $$ItemTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemTypeTableOrderingComposer
    extends Composer<_$AppDb, $ItemTypeTable> {
  $$ItemTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemTypeTableAnnotationComposer
    extends Composer<_$AppDb, $ItemTypeTable> {
  $$ItemTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$ItemTypeTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ItemTypeTable,
          ItemType,
          $$ItemTypeTableFilterComposer,
          $$ItemTypeTableOrderingComposer,
          $$ItemTypeTableAnnotationComposer,
          $$ItemTypeTableCreateCompanionBuilder,
          $$ItemTypeTableUpdateCompanionBuilder,
          (ItemType, BaseReferences<_$AppDb, $ItemTypeTable, ItemType>),
          ItemType,
          PrefetchHooks Function()
        > {
  $$ItemTypeTableTableManager(_$AppDb db, $ItemTypeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ItemTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ItemTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ItemTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => ItemTypeCompanion(
                id: id,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
              }) => ItemTypeCompanion.insert(
                id: id,
                name: name,
                description: description,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemTypeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ItemTypeTable,
      ItemType,
      $$ItemTypeTableFilterComposer,
      $$ItemTypeTableOrderingComposer,
      $$ItemTypeTableAnnotationComposer,
      $$ItemTypeTableCreateCompanionBuilder,
      $$ItemTypeTableUpdateCompanionBuilder,
      (ItemType, BaseReferences<_$AppDb, $ItemTypeTable, ItemType>),
      ItemType,
      PrefetchHooks Function()
    >;
typedef $$PackageSizeTableCreateCompanionBuilder =
    PackageSizeCompanion Function({
      Value<int> id,
      required String name,
      required double dimension,
      Value<double?> weight,
      Value<String?> description,
      required String sizeType,
    });
typedef $$PackageSizeTableUpdateCompanionBuilder =
    PackageSizeCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> dimension,
      Value<double?> weight,
      Value<String?> description,
      Value<String> sizeType,
    });

class $$PackageSizeTableFilterComposer
    extends Composer<_$AppDb, $PackageSizeTable> {
  $$PackageSizeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dimension => $composableBuilder(
    column: $table.dimension,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sizeType => $composableBuilder(
    column: $table.sizeType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PackageSizeTableOrderingComposer
    extends Composer<_$AppDb, $PackageSizeTable> {
  $$PackageSizeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dimension => $composableBuilder(
    column: $table.dimension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sizeType => $composableBuilder(
    column: $table.sizeType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PackageSizeTableAnnotationComposer
    extends Composer<_$AppDb, $PackageSizeTable> {
  $$PackageSizeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get dimension =>
      $composableBuilder(column: $table.dimension, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sizeType =>
      $composableBuilder(column: $table.sizeType, builder: (column) => column);
}

class $$PackageSizeTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PackageSizeTable,
          PackageSize,
          $$PackageSizeTableFilterComposer,
          $$PackageSizeTableOrderingComposer,
          $$PackageSizeTableAnnotationComposer,
          $$PackageSizeTableCreateCompanionBuilder,
          $$PackageSizeTableUpdateCompanionBuilder,
          (
            PackageSize,
            BaseReferences<_$AppDb, $PackageSizeTable, PackageSize>,
          ),
          PackageSize,
          PrefetchHooks Function()
        > {
  $$PackageSizeTableTableManager(_$AppDb db, $PackageSizeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PackageSizeTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PackageSizeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$PackageSizeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> dimension = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> sizeType = const Value.absent(),
              }) => PackageSizeCompanion(
                id: id,
                name: name,
                dimension: dimension,
                weight: weight,
                description: description,
                sizeType: sizeType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double dimension,
                Value<double?> weight = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required String sizeType,
              }) => PackageSizeCompanion.insert(
                id: id,
                name: name,
                dimension: dimension,
                weight: weight,
                description: description,
                sizeType: sizeType,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PackageSizeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PackageSizeTable,
      PackageSize,
      $$PackageSizeTableFilterComposer,
      $$PackageSizeTableOrderingComposer,
      $$PackageSizeTableAnnotationComposer,
      $$PackageSizeTableCreateCompanionBuilder,
      $$PackageSizeTableUpdateCompanionBuilder,
      (PackageSize, BaseReferences<_$AppDb, $PackageSizeTable, PackageSize>),
      PackageSize,
      PrefetchHooks Function()
    >;
typedef $$ServiceTableCreateCompanionBuilder =
    ServiceCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
    });
typedef $$ServiceTableUpdateCompanionBuilder =
    ServiceCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
    });

class $$ServiceTableFilterComposer extends Composer<_$AppDb, $ServiceTable> {
  $$ServiceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ServiceTableOrderingComposer extends Composer<_$AppDb, $ServiceTable> {
  $$ServiceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServiceTableAnnotationComposer
    extends Composer<_$AppDb, $ServiceTable> {
  $$ServiceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$ServiceTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ServiceTable,
          Service,
          $$ServiceTableFilterComposer,
          $$ServiceTableOrderingComposer,
          $$ServiceTableAnnotationComposer,
          $$ServiceTableCreateCompanionBuilder,
          $$ServiceTableUpdateCompanionBuilder,
          (Service, BaseReferences<_$AppDb, $ServiceTable, Service>),
          Service,
          PrefetchHooks Function()
        > {
  $$ServiceTableTableManager(_$AppDb db, $ServiceTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ServiceTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ServiceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ServiceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => ServiceCompanion(
                id: id,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
              }) => ServiceCompanion.insert(
                id: id,
                name: name,
                description: description,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ServiceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ServiceTable,
      Service,
      $$ServiceTableFilterComposer,
      $$ServiceTableOrderingComposer,
      $$ServiceTableAnnotationComposer,
      $$ServiceTableCreateCompanionBuilder,
      $$ServiceTableUpdateCompanionBuilder,
      (Service, BaseReferences<_$AppDb, $ServiceTable, Service>),
      Service,
      PrefetchHooks Function()
    >;
typedef $$ServicePriceTableCreateCompanionBuilder =
    ServicePriceCompanion Function({
      Value<int> id,
      required int serviceId,
      required int packageSizeId,
      required double price,
    });
typedef $$ServicePriceTableUpdateCompanionBuilder =
    ServicePriceCompanion Function({
      Value<int> id,
      Value<int> serviceId,
      Value<int> packageSizeId,
      Value<double> price,
    });

class $$ServicePriceTableFilterComposer
    extends Composer<_$AppDb, $ServicePriceTable> {
  $$ServicePriceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get packageSizeId => $composableBuilder(
    column: $table.packageSizeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ServicePriceTableOrderingComposer
    extends Composer<_$AppDb, $ServicePriceTable> {
  $$ServicePriceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get packageSizeId => $composableBuilder(
    column: $table.packageSizeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServicePriceTableAnnotationComposer
    extends Composer<_$AppDb, $ServicePriceTable> {
  $$ServicePriceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  GeneratedColumn<int> get packageSizeId => $composableBuilder(
    column: $table.packageSizeId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$ServicePriceTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ServicePriceTable,
          ServicePrice,
          $$ServicePriceTableFilterComposer,
          $$ServicePriceTableOrderingComposer,
          $$ServicePriceTableAnnotationComposer,
          $$ServicePriceTableCreateCompanionBuilder,
          $$ServicePriceTableUpdateCompanionBuilder,
          (
            ServicePrice,
            BaseReferences<_$AppDb, $ServicePriceTable, ServicePrice>,
          ),
          ServicePrice,
          PrefetchHooks Function()
        > {
  $$ServicePriceTableTableManager(_$AppDb db, $ServicePriceTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ServicePriceTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ServicePriceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$ServicePriceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> serviceId = const Value.absent(),
                Value<int> packageSizeId = const Value.absent(),
                Value<double> price = const Value.absent(),
              }) => ServicePriceCompanion(
                id: id,
                serviceId: serviceId,
                packageSizeId: packageSizeId,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int serviceId,
                required int packageSizeId,
                required double price,
              }) => ServicePriceCompanion.insert(
                id: id,
                serviceId: serviceId,
                packageSizeId: packageSizeId,
                price: price,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ServicePriceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ServicePriceTable,
      ServicePrice,
      $$ServicePriceTableFilterComposer,
      $$ServicePriceTableOrderingComposer,
      $$ServicePriceTableAnnotationComposer,
      $$ServicePriceTableCreateCompanionBuilder,
      $$ServicePriceTableUpdateCompanionBuilder,
      (ServicePrice, BaseReferences<_$AppDb, $ServicePriceTable, ServicePrice>),
      ServicePrice,
      PrefetchHooks Function()
    >;
typedef $$OrderTableCreateCompanionBuilder =
    OrderCompanion Function({
      Value<int> id,
      required String senderName,
      required String senderPhone,
      required String senderAddress,
      required String recipientName,
      required String recipientPhone,
      required String recipientAddress,
      required int packageSizeId,
      required int itemTypeId,
      required int serviceId,
      required int servicePriceId,
      required int totalPayment,
      required String paymentMethod,
    });
typedef $$OrderTableUpdateCompanionBuilder =
    OrderCompanion Function({
      Value<int> id,
      Value<String> senderName,
      Value<String> senderPhone,
      Value<String> senderAddress,
      Value<String> recipientName,
      Value<String> recipientPhone,
      Value<String> recipientAddress,
      Value<int> packageSizeId,
      Value<int> itemTypeId,
      Value<int> serviceId,
      Value<int> servicePriceId,
      Value<int> totalPayment,
      Value<String> paymentMethod,
    });

class $$OrderTableFilterComposer extends Composer<_$AppDb, $OrderTable> {
  $$OrderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderPhone => $composableBuilder(
    column: $table.senderPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderAddress => $composableBuilder(
    column: $table.senderAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientPhone => $composableBuilder(
    column: $table.recipientPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientAddress => $composableBuilder(
    column: $table.recipientAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get packageSizeId => $composableBuilder(
    column: $table.packageSizeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get itemTypeId => $composableBuilder(
    column: $table.itemTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get servicePriceId => $composableBuilder(
    column: $table.servicePriceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPayment => $composableBuilder(
    column: $table.totalPayment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderTableOrderingComposer extends Composer<_$AppDb, $OrderTable> {
  $$OrderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderPhone => $composableBuilder(
    column: $table.senderPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderAddress => $composableBuilder(
    column: $table.senderAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientPhone => $composableBuilder(
    column: $table.recipientPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientAddress => $composableBuilder(
    column: $table.recipientAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get packageSizeId => $composableBuilder(
    column: $table.packageSizeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get itemTypeId => $composableBuilder(
    column: $table.itemTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get servicePriceId => $composableBuilder(
    column: $table.servicePriceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPayment => $composableBuilder(
    column: $table.totalPayment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderTableAnnotationComposer extends Composer<_$AppDb, $OrderTable> {
  $$OrderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get senderPhone => $composableBuilder(
    column: $table.senderPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get senderAddress => $composableBuilder(
    column: $table.senderAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientPhone => $composableBuilder(
    column: $table.recipientPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientAddress => $composableBuilder(
    column: $table.recipientAddress,
    builder: (column) => column,
  );

  GeneratedColumn<int> get packageSizeId => $composableBuilder(
    column: $table.packageSizeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get itemTypeId => $composableBuilder(
    column: $table.itemTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  GeneratedColumn<int> get servicePriceId => $composableBuilder(
    column: $table.servicePriceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalPayment => $composableBuilder(
    column: $table.totalPayment,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );
}

class $$OrderTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $OrderTable,
          OrderData,
          $$OrderTableFilterComposer,
          $$OrderTableOrderingComposer,
          $$OrderTableAnnotationComposer,
          $$OrderTableCreateCompanionBuilder,
          $$OrderTableUpdateCompanionBuilder,
          (OrderData, BaseReferences<_$AppDb, $OrderTable, OrderData>),
          OrderData,
          PrefetchHooks Function()
        > {
  $$OrderTableTableManager(_$AppDb db, $OrderTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$OrderTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$OrderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$OrderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> senderName = const Value.absent(),
                Value<String> senderPhone = const Value.absent(),
                Value<String> senderAddress = const Value.absent(),
                Value<String> recipientName = const Value.absent(),
                Value<String> recipientPhone = const Value.absent(),
                Value<String> recipientAddress = const Value.absent(),
                Value<int> packageSizeId = const Value.absent(),
                Value<int> itemTypeId = const Value.absent(),
                Value<int> serviceId = const Value.absent(),
                Value<int> servicePriceId = const Value.absent(),
                Value<int> totalPayment = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
              }) => OrderCompanion(
                id: id,
                senderName: senderName,
                senderPhone: senderPhone,
                senderAddress: senderAddress,
                recipientName: recipientName,
                recipientPhone: recipientPhone,
                recipientAddress: recipientAddress,
                packageSizeId: packageSizeId,
                itemTypeId: itemTypeId,
                serviceId: serviceId,
                servicePriceId: servicePriceId,
                totalPayment: totalPayment,
                paymentMethod: paymentMethod,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String senderName,
                required String senderPhone,
                required String senderAddress,
                required String recipientName,
                required String recipientPhone,
                required String recipientAddress,
                required int packageSizeId,
                required int itemTypeId,
                required int serviceId,
                required int servicePriceId,
                required int totalPayment,
                required String paymentMethod,
              }) => OrderCompanion.insert(
                id: id,
                senderName: senderName,
                senderPhone: senderPhone,
                senderAddress: senderAddress,
                recipientName: recipientName,
                recipientPhone: recipientPhone,
                recipientAddress: recipientAddress,
                packageSizeId: packageSizeId,
                itemTypeId: itemTypeId,
                serviceId: serviceId,
                servicePriceId: servicePriceId,
                totalPayment: totalPayment,
                paymentMethod: paymentMethod,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $OrderTable,
      OrderData,
      $$OrderTableFilterComposer,
      $$OrderTableOrderingComposer,
      $$OrderTableAnnotationComposer,
      $$OrderTableCreateCompanionBuilder,
      $$OrderTableUpdateCompanionBuilder,
      (OrderData, BaseReferences<_$AppDb, $OrderTable, OrderData>),
      OrderData,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$ItemTypeTableTableManager get itemType =>
      $$ItemTypeTableTableManager(_db, _db.itemType);
  $$PackageSizeTableTableManager get packageSize =>
      $$PackageSizeTableTableManager(_db, _db.packageSize);
  $$ServiceTableTableManager get service =>
      $$ServiceTableTableManager(_db, _db.service);
  $$ServicePriceTableTableManager get servicePrice =>
      $$ServicePriceTableTableManager(_db, _db.servicePrice);
  $$OrderTableTableManager get order =>
      $$OrderTableTableManager(_db, _db.order);
}
