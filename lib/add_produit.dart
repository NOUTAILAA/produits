// add_produit.dart
import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
    final Function(String) onSubmit;
    final TextEditingController _controller = TextEditingController();

    AddProduit({required this.onSubmit});

    @override
    Widget build(BuildContext context) {
        return AlertDialog(
            title: Text("Ajouter un produit"),
            content: TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: "Nom du produit"),
            ),
            actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Annuler"),
                ),
                TextButton(
                    onPressed: () {
                        if (_controller.text.isNotEmpty) {
                            onSubmit(_controller.text);
                            Navigator.pop(context);
                        }
                    },
                    child: Text("Ajouter"),
                ),
            ],
        );
    }
}
