import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';
import 'produit.dart';
import 'product_details.dart';

class ProduitsList extends StatefulWidget {
    @override
    _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
    List<Produit> produits = [
        Produit(libelle: "Produit 1", description: "Description 1", prix: 10.0, photo: "https://via.placeholder.com/150"),
        Produit(libelle: "Produit 2", description: "Description 2", prix: 20.0, photo: "https://via.placeholder.com/150"),
        Produit(libelle: "Produit 3", description: "Description 3", prix: 30.0, photo: "https://via.placeholder.com/150"),
    ];

    void toggleSelection(int index, bool? isSelected) {
    setState(() {
        produits[index] = Produit(
            libelle: produits[index].libelle,
            description: produits[index].description,
            prix: produits[index].prix,
            photo: produits[index].photo,
            selected: isSelected ?? false,
        );
    });
}


    void ajouterProduit(Produit produit) {
        setState(() {
            produits.add(produit);
        });
    }

    void supprimerProduit(int index) {
        setState(() {
            produits.removeAt(index);
        });
    }

    void supprimerProduitsSelectionnes() {
        setState(() {
            produits.removeWhere((produit) => produit.selected == true);
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
                    return GestureDetector(
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetails(produit: produits[index]),
                                ),
                            );
                        },
                        child: ProduitBox(
                            produit: produits[index],
                            selProduit: produits[index].selected,
                            onChanged: (bool? isSelected) => toggleSelection(index, isSelected),
                            delProduit: () => supprimerProduit(index),
                        ),
                    );
                },
            ),
        );
    }
}
