import 'catalog_item.dart';

class CatalogSection {
  final String title; // ← untuk nama kategori seperti Atom, Molecul, Organism
  final List<CatalogItem> items;

  CatalogSection({
    required this.title,
    required this.items,
  });
}
