import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

// Génération automatique
part 'base.g.dart';

// Définition des tables
@DataClassName('ProduitsTable')
class Produits extends Table {
  TextColumn get libelle => text()();
  TextColumn get description => text()();
  RealColumn get prix => real()();
  TextColumn get photo => text()();

  @override
  Set<Column> get primaryKey => {libelle};
}

// Base de données
@DriftDatabase(tables: [Produits])
class ProduitsDatabase extends _$ProduitsDatabase {
  ProduitsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ProduitsTable>> getAllProduits() => select(produits).get();
  Future insertProduit(ProduitsTable produit) => into(produits).insert(produit);
  Future deleteProduit(ProduitsTable produit) => delete(produits).delete(produit);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
