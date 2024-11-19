import 'package:flutter/material.dart';
import 'data/base.dart';
import 'dao/produit_dao.dart';
import 'produit.dart';
import 'add_produit.dart';
import 'product_details.dart';

class ProduitsList extends StatelessWidget {
  final ProduitDAO produitDAO;

  ProduitsList({required this.produitDAO});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddProduit(onSubmit: (produit) {
                  produitDAO.addProduit(ProduitsTable(
                    libelle: produit.libelle,
                    description: produit.description,
                    prix: produit.prix,
                    photo: produit.photo,
                  ));
                }),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<ProduitsTable>>(
        stream: produitDAO.getProduits().asStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final produits = snapshot.data!;
            return ListView.builder(
              itemCount: produits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(produits[index].libelle),
                  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetails(
        produit: Produit(
          libelle: produits[index].libelle,
          description: produits[index].description ?? '',
          prix: produits[index].prix,
          photo: produits[index].photo ?? '',
        ),
      ),
    ),
  );
},

                );
              },
            );
          } else {
            return Center(child: Text('Aucun produit trouvé.'));
          }
        },
      ),
    );
  }
}
