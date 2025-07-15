import 'package:flutter/material.dart';
import '../models/catalog_item.dart';
import '../models/catalog_section.dart';

// Component pages
import '../widgets/tpe_component_button.dart';
import '../widgets/tpe_component_button_circle.dart';
import '../widgets/tpe_component_card_balance.dart';
import '../widgets/tpe_component_label.dart';
import '../widgets/tpe_component_menu_horizontal.dart';
import '../widgets/tpe_component_menu_vertical.dart';
import '../widgets/tpe_component_section.dart';

class ComponentCatalogScreen extends StatelessWidget {
  const ComponentCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _buildSections().first.items;

    return Scaffold(
      appBar: AppBar(title: const Text("Component Catalog")),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = items[index];
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
        },
      ),
    );
  }

  List<CatalogSection> _buildSections() {
    return [
      CatalogSection(
        items: [
          CatalogItem(
            icon: Icons.radio_button_checked, // More representative of a circular icon
            label: "Icon Circle Button",
            destination: const TPEComponentButtonCircle(),
          ),
          CatalogItem(
            icon: Icons.label_important, // Label style icon
            label: "Label Success",
            destination: const TPEComponentLabel(),
          ),
          CatalogItem(
            icon: Icons.view_stream, // Vertical menu style icon
            label: "Menu Vertical",
            destination: const TPEComponentMenuVertical(),
          ),
          CatalogItem(
            icon: Icons.smart_button, // Represents a button well
            label: "Button",
            destination: const TPEComponentButton(),
          ),
          CatalogItem(
            icon: Icons.account_balance_wallet, // Represents a balance card better
            label: "Card",
            destination: const TPEComponentCardBalance(),
          ),
          CatalogItem(
            icon: Icons.view_week, // Represents section/grouping
            label: "Section",
            destination: const TPEComponentSection(),
          ),
          CatalogItem(
            icon: Icons.dashboard_customize, // Represents horizontal menu
            label: "Menu Horizontal",
            destination: const TPEComponentMenuHorizontal(),
          )

        ],
      ),
    ];
  }
}
