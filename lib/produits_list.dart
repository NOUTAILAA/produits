import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'data/base.dart';
import 'dao/produit_dao.dart';
import 'produit.dart';
import 'add_produit.dart';
import 'product_details.dart';

class ProduitsList extends StatefulWidget {
  final ProduitDAO produitDAO;

  ProduitsList({required this.produitDAO});

  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  Map<String, bool> selectedProducts = {}; // Map pour stocker les produits sélectionnés

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
                  widget.produitDAO.addProduit(ProduitsTable(
                    libelle: produit.libelle,
                    description: produit.description,
                    prix: produit.prix,
                    photo: produit.photo,
                  ));
                  setState(() {});
                }),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Supprimer tous les produits sélectionnés
              selectedProducts.forEach((libelle, isSelected) {
                if (isSelected) {
                  widget.produitDAO.deleteProduit(
                    ProduitsTable(libelle: libelle, description: '', prix: 0, photo: ''),
                  );
                }
              });
              setState(() {
                selectedProducts.clear(); // Réinitialise les sélections après suppression
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<List<ProduitsTable>>(
        stream: widget.produitDAO.getProduits().asStream(),
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
                final produit = produits[index];
                return Slidable(
                  key: ValueKey(produit.libelle),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          await widget.produitDAO.deleteProduit(produit);
                          setState(() {}); // Met à jour la liste après suppression
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Supprimer',
                      ),
                    ],
                  ),
                  child: CheckboxListTile(
                    value: selectedProducts[produit.libelle] ?? false,
                    onChanged: (bool? isSelected) {
                      setState(() {
                        selectedProducts[produit.libelle] = isSelected ?? false;
                      });
                    },
                    title: Text(produit.libelle),
                    subtitle: Text(produit.description ?? ''),
                    secondary: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showEditDialog(context, produit);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.info, color: Colors.green),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  produit: Produit(
                                    libelle: produit.libelle,
                                    description: produit.description ?? '',
                                    prix: produit.prix,
                                    photo: produit.photo ?? '',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
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

  void _showEditDialog(BuildContext context, ProduitsTable produit) {
    final TextEditingController libelleController = TextEditingController(text: produit.libelle);
    final TextEditingController descriptionController = TextEditingController(text: produit.description ?? '');
    final TextEditingController prixController = TextEditingController(text: produit.prix.toString());
    final TextEditingController photoController = TextEditingController(text: produit.photo ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Modifier le produit"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: libelleController, decoration: InputDecoration(labelText: 'Libelle'), enabled: false),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            TextField(controller: prixController, decoration: InputDecoration(labelText: 'Prix'), keyboardType: TextInputType.number),
            TextField(controller: photoController, decoration: InputDecoration(labelText: 'Photo URL')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Annuler")),
          TextButton(
            onPressed: () {
              final updatedProduit = ProduitsTable(
                libelle: produit.libelle,
                description: descriptionController.text,
                prix: double.parse(prixController.text),
                photo: photoController.text,
              );
              widget.produitDAO.updateProduit(updatedProduit);
              setState(() {});
              Navigator.pop(context);
            },
            child: Text("Modifier"),
          ),
        ],
      ),
    );
  }
}
