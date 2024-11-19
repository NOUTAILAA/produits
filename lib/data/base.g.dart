// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// ignore_for_file: type=lint
class $ProduitsTable extends Produits
    with TableInfo<$ProduitsTable, ProduitsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProduitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _libelleMeta =
      const VerificationMeta('libelle');
  @override
  late final GeneratedColumn<String> libelle = GeneratedColumn<String>(
      'libelle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prixMeta = const VerificationMeta('prix');
  @override
  late final GeneratedColumn<double> prix = GeneratedColumn<double>(
      'prix', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [libelle, description, prix, photo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'produits';
  @override
  VerificationContext validateIntegrity(Insertable<ProduitsTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('libelle')) {
      context.handle(_libelleMeta,
          libelle.isAcceptableOrUnknown(data['libelle']!, _libelleMeta));
    } else if (isInserting) {
      context.missing(_libelleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('prix')) {
      context.handle(
          _prixMeta, prix.isAcceptableOrUnknown(data['prix']!, _prixMeta));
    } else if (isInserting) {
      context.missing(_prixMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {libelle};
  @override
  ProduitsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProduitsTable(
      libelle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}libelle'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      prix: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}prix'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo'])!,
    );
  }

  @override
  $ProduitsTable createAlias(String alias) {
    return $ProduitsTable(attachedDatabase, alias);
  }
}

class ProduitsTable extends DataClass implements Insertable<ProduitsTable> {
  final String libelle;
  final String description;
  final double prix;
  final String photo;
  const ProduitsTable(
      {required this.libelle,
      required this.description,
      required this.prix,
      required this.photo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['libelle'] = Variable<String>(libelle);
    map['description'] = Variable<String>(description);
    map['prix'] = Variable<double>(prix);
    map['photo'] = Variable<String>(photo);
    return map;
  }

  ProduitsCompanion toCompanion(bool nullToAbsent) {
    return ProduitsCompanion(
      libelle: Value(libelle),
      description: Value(description),
      prix: Value(prix),
      photo: Value(photo),
    );
  }

  factory ProduitsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProduitsTable(
      libelle: serializer.fromJson<String>(json['libelle']),
      description: serializer.fromJson<String>(json['description']),
      prix: serializer.fromJson<double>(json['prix']),
      photo: serializer.fromJson<String>(json['photo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'libelle': serializer.toJson<String>(libelle),
      'description': serializer.toJson<String>(description),
      'prix': serializer.toJson<double>(prix),
      'photo': serializer.toJson<String>(photo),
    };
  }

  ProduitsTable copyWith(
          {String? libelle,
          String? description,
          double? prix,
          String? photo}) =>
      ProduitsTable(
        libelle: libelle ?? this.libelle,
        description: description ?? this.description,
        prix: prix ?? this.prix,
        photo: photo ?? this.photo,
      );
  ProduitsTable copyWithCompanion(ProduitsCompanion data) {
    return ProduitsTable(
      libelle: data.libelle.present ? data.libelle.value : this.libelle,
      description:
          data.description.present ? data.description.value : this.description,
      prix: data.prix.present ? data.prix.value : this.prix,
      photo: data.photo.present ? data.photo.value : this.photo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProduitsTable(')
          ..write('libelle: $libelle, ')
          ..write('description: $description, ')
          ..write('prix: $prix, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(libelle, description, prix, photo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProduitsTable &&
          other.libelle == this.libelle &&
          other.description == this.description &&
          other.prix == this.prix &&
          other.photo == this.photo);
}

class ProduitsCompanion extends UpdateCompanion<ProduitsTable> {
  final Value<String> libelle;
  final Value<String> description;
  final Value<double> prix;
  final Value<String> photo;
  final Value<int> rowid;
  const ProduitsCompanion({
    this.libelle = const Value.absent(),
    this.description = const Value.absent(),
    this.prix = const Value.absent(),
    this.photo = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProduitsCompanion.insert({
    required String libelle,
    required String description,
    required double prix,
    required String photo,
    this.rowid = const Value.absent(),
  })  : libelle = Value(libelle),
        description = Value(description),
        prix = Value(prix),
        photo = Value(photo);
  static Insertable<ProduitsTable> custom({
    Expression<String>? libelle,
    Expression<String>? description,
    Expression<double>? prix,
    Expression<String>? photo,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (libelle != null) 'libelle': libelle,
      if (description != null) 'description': description,
      if (prix != null) 'prix': prix,
      if (photo != null) 'photo': photo,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProduitsCompanion copyWith(
      {Value<String>? libelle,
      Value<String>? description,
      Value<double>? prix,
      Value<String>? photo,
      Value<int>? rowid}) {
    return ProduitsCompanion(
      libelle: libelle ?? this.libelle,
      description: description ?? this.description,
      prix: prix ?? this.prix,
      photo: photo ?? this.photo,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (libelle.present) {
      map['libelle'] = Variable<String>(libelle.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (prix.present) {
      map['prix'] = Variable<double>(prix.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProduitsCompanion(')
          ..write('libelle: $libelle, ')
          ..write('description: $description, ')
          ..write('prix: $prix, ')
          ..write('photo: $photo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ProduitsDatabase extends GeneratedDatabase {
  _$ProduitsDatabase(QueryExecutor e) : super(e);
  $ProduitsDatabaseManager get managers => $ProduitsDatabaseManager(this);
  late final $ProduitsTable produits = $ProduitsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [produits];
}

typedef $$ProduitsTableCreateCompanionBuilder = ProduitsCompanion Function({
  required String libelle,
  required String description,
  required double prix,
  required String photo,
  Value<int> rowid,
});
typedef $$ProduitsTableUpdateCompanionBuilder = ProduitsCompanion Function({
  Value<String> libelle,
  Value<String> description,
  Value<double> prix,
  Value<String> photo,
  Value<int> rowid,
});

class $$ProduitsTableFilterComposer
    extends Composer<_$ProduitsDatabase, $ProduitsTable> {
  $$ProduitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get libelle => $composableBuilder(
      column: $table.libelle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get prix => $composableBuilder(
      column: $table.prix, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnFilters(column));
}

class $$ProduitsTableOrderingComposer
    extends Composer<_$ProduitsDatabase, $ProduitsTable> {
  $$ProduitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get libelle => $composableBuilder(
      column: $table.libelle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get prix => $composableBuilder(
      column: $table.prix, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photo => $composableBuilder(
      column: $table.photo, builder: (column) => ColumnOrderings(column));
}

class $$ProduitsTableAnnotationComposer
    extends Composer<_$ProduitsDatabase, $ProduitsTable> {
  $$ProduitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get libelle =>
      $composableBuilder(column: $table.libelle, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get prix =>
      $composableBuilder(column: $table.prix, builder: (column) => column);

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);
}

class $$ProduitsTableTableManager extends RootTableManager<
    _$ProduitsDatabase,
    $ProduitsTable,
    ProduitsTable,
    $$ProduitsTableFilterComposer,
    $$ProduitsTableOrderingComposer,
    $$ProduitsTableAnnotationComposer,
    $$ProduitsTableCreateCompanionBuilder,
    $$ProduitsTableUpdateCompanionBuilder,
    (
      ProduitsTable,
      BaseReferences<_$ProduitsDatabase, $ProduitsTable, ProduitsTable>
    ),
    ProduitsTable,
    PrefetchHooks Function()> {
  $$ProduitsTableTableManager(_$ProduitsDatabase db, $ProduitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProduitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProduitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProduitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> libelle = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> prix = const Value.absent(),
            Value<String> photo = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProduitsCompanion(
            libelle: libelle,
            description: description,
            prix: prix,
            photo: photo,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String libelle,
            required String description,
            required double prix,
            required String photo,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProduitsCompanion.insert(
            libelle: libelle,
            description: description,
            prix: prix,
            photo: photo,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProduitsTableProcessedTableManager = ProcessedTableManager<
    _$ProduitsDatabase,
    $ProduitsTable,
    ProduitsTable,
    $$ProduitsTableFilterComposer,
    $$ProduitsTableOrderingComposer,
    $$ProduitsTableAnnotationComposer,
    $$ProduitsTableCreateCompanionBuilder,
    $$ProduitsTableUpdateCompanionBuilder,
    (
      ProduitsTable,
      BaseReferences<_$ProduitsDatabase, $ProduitsTable, ProduitsTable>
    ),
    ProduitsTable,
    PrefetchHooks Function()>;

class $ProduitsDatabaseManager {
  final _$ProduitsDatabase _db;
  $ProduitsDatabaseManager(this._db);
  $$ProduitsTableTableManager get produits =>
      $$ProduitsTableTableManager(_db, _db.produits);
}
