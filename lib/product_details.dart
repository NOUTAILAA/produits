import 'package:flutter/material.dart';
import 'produit.dart';

class ProductDetails extends StatelessWidget {
    final Produit produit;

    ProductDetails({required this.produit});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text(produit.libelle)),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Image.network(produit.photo),
                        SizedBox(height: 16),
                        Text(produit.libelle, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text(produit.description),
                        SizedBox(height: 8),
                        Text("Prix: ${produit.prix}"),
                    ],
                ),
            ),
        );
    }
}
