import 'package:flutter/material.dart';
import 'produits_list.dart';
import 'data/base.dart';
import 'dao/produit_dao.dart';

void main() {
  final database = ProduitsDatabase();
  final produitDAO = ProduitDAO(database);

  runApp(ProduitsApp(produitDAO: produitDAO));
}

class ProduitsApp extends StatelessWidget {
  final ProduitDAO produitDAO;

  ProduitsApp({required this.produitDAO});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produits App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProduitsList(produitDAO: produitDAO),
    );
  }
}
