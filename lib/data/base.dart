import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'base.g.dart';

@DataClassName('ProduitsTable')
class Produits extends Table {
  TextColumn get libelle => text()();
  TextColumn get description => text().nullable()();
  RealColumn get prix => real()();
  TextColumn get photo => text().nullable()();

  @override
  Set<Column> get primaryKey => {libelle};
}

@DriftDatabase(tables: [Produits])
class ProduitsDatabase extends _$ProduitsDatabase {
  ProduitsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ProduitsTable>> getAllProduits() => select(produits).get();
  Future insertProduit(ProduitsTable produit) => into(produits).insert(produit);
  Future deleteProduit(ProduitsTable produit) async {
    await (delete(produits)..where((tbl) => tbl.libelle.equals(produit.libelle))).go();
  }
  Future updateProduit(ProduitsTable produit) async {
  await (update(produits)..where((tbl) => tbl.libelle.equals(produit.libelle)))
      .write(ProduitsCompanion(
        description: Value(produit.description),
        prix: Value(produit.prix),
        photo: Value(produit.photo),
      ));
}

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
