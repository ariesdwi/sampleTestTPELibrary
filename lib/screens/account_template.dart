import 'package:flutter/material.dart';
import '../models/catalog_item.dart';
import '../models/catalog_section.dart';
import '../widgets/molecule/tpe_molecule_button_circle.dart';

class AccountTemplate extends StatelessWidget {
  const AccountTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = _buildSections(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Account Template")),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return ExpansionTile(
            title: Text(
              section.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: section.items.map((item) {
              return ListTile(
                leading: Icon(item.icon, color: Colors.blue),
                title: Text(item.label),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  if (item.destination != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => item.destination!),
                    );
                  }
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  List<CatalogSection> _buildSections(BuildContext context) {
    return [
      CatalogSection(
        title: "Template",
        items: [
          CatalogItem(
              label: "TPECircleIconButton",
              icon: Icons.radio_button_checked,
              destination: const TPEComponentButtonCircle()),
        ],
      ),
    ];
  }
}
