import 'package:flutter/material.dart';
import 'produit.dart';

class AddProduit extends StatelessWidget {
  final Function(Produit) onSubmit;
  final TextEditingController _libelleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();

  AddProduit({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ajouter un produit"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _libelleController, decoration: InputDecoration(hintText: "Libelle")),
          TextField(controller: _descriptionController, decoration: InputDecoration(hintText: "Description")),
          TextField(controller: _prixController, decoration: InputDecoration(hintText: "Prix"), keyboardType: TextInputType.number),
          TextField(controller: _photoController, decoration: InputDecoration(hintText: "Photo URL")),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Annuler")),
        TextButton(
          onPressed: () {
            if (_libelleController.text.isNotEmpty && _prixController.text.isNotEmpty) {
              onSubmit(Produit(
                libelle: _libelleController.text,
                description: _descriptionController.text,
                prix: double.parse(_prixController.text),
                photo: _photoController.text,
              ));
              Navigator.pop(context);
            }
          },
          child: Text("Ajouter"),
        ),
      ],
    );
  }
}
