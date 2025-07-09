import 'package:flutter/material.dart';

class CatalogItem {
  final IconData icon;
  final String label;
  final Widget? destination;

  CatalogItem({
    required this.icon,
    required this.label,
    this.destination,
  });
}
