// produits_list.dart
import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';

class ProduitsList extends StatefulWidget {
    @override
    _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
    List<Map<String, dynamic>> produits = [
        {"nom": "Produit 1", "selected": false},
        {"nom": "Produit 2", "selected": false},
        {"nom": "Produit 3", "selected": false}
    ];

    void toggleSelection(int index, bool? isSelected) {
        setState(() {
            produits[index]['selected'] = isSelected!;
        });
    }

    void ajouterProduit(String nom) {
        setState(() {
            produits.add({"nom": nom, "selected": false});
        });
    }

    void supprimerProduit(int index) {
        setState(() {
            produits.removeAt(index);
        });
    }

    void supprimerProduitsSelectionnes() {
        setState(() {
            produits.removeWhere((produit) => produit['selected'] == true);
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Liste des Produits"),
                actions: [
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AddProduit(onSubmit: ajouterProduit),
                            );
                        },
                    ),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: supprimerProduitsSelectionnes,
                    ),
                ],
            ),
            body: ListView.builder(
                itemCount: produits.length,
                itemBuilder: (context, index) {
                    return ProduitBox(
                        nomProduit: produits[index]['nom'],
                        selProduit: produits[index]['selected'],
                        onChanged: (bool? isSelected) => toggleSelection(index, isSelected),
                        delProduit: () => supprimerProduit(index),
                    );
                },
            ),
        );
    }
}
