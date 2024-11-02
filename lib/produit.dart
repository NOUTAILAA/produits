class Produit {
    final String libelle;
    final String description;
    final double prix;
    final String photo;
    bool selected;

    Produit({
        required this.libelle,
        required this.description,
        required this.prix,
        required this.photo,
        this.selected = false,
    });
}
