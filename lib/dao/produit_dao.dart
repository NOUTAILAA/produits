import 'package:drift/drift.dart';
import '.././data/base.dart';

class ProduitDAO {
  final ProduitsDatabase _db;

  ProduitDAO(this._db);

  Future<List<ProduitsTable>> getProduits() => _db.getAllProduits();
  Future addProduit(ProduitsTable produit) => _db.insertProduit(produit);
  Future deleteProduit(ProduitsTable produit) => _db.deleteProduit(produit);
Future updateProduit(ProduitsTable produit) => _db.updateProduit(produit);

}
