// produit_box.dart
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
    final String nomProduit;
    final bool selProduit;
    final Function(bool?) onChanged;
    final VoidCallback delProduit;

    ProduitBox({
        required this.nomProduit,
        required this.selProduit,
        required this.onChanged,
        required this.delProduit,
    });

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.all(8.0),
            child: Slidable(
                // Utilisez ActionPane avec DrawerMotion pour la compatibilité
                endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                        SlidableAction(
                            onPressed: (context) => delProduit(),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Supprimer',
                        ),
                    ],
                ),
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Row(
                                children: [
                                    Checkbox(value: selProduit, onChanged: onChanged),
                                    Text(nomProduit),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
