
import 'package:flutter/material.dart';
import 'package:hello_ios/widgets/atoms/tpe_balance_indicator.dart';
import 'package:hello_ios/widgets/atoms/tpe_base_card.dart';
import 'package:hello_ios/widgets/atoms/tpe_base_icon.dart';
import 'package:hello_ios/widgets/atoms/tpe_copy_button.dart';
import 'package:hello_ios/widgets/atoms/tpe_count_badge_label.dart';
import 'package:hello_ios/widgets/atoms/tpe_eye_toggle_button.dart';
import 'package:hello_ios/widgets/atoms/tpe_menu_badge_label.dart';
import 'package:hello_ios/widgets/atoms/tpe_text_variant.dart';
import 'package:hello_ios/widgets/tpe_organism_menu.dart';
import 'package:hello_ios/widgets/tpe_organism_promo.dart';
import 'package:hello_ios/widgets/tpe_organism_transaction.dart';
import 'package:hello_ios/widgets/tpe_transaction_item.dart';
import '../models/catalog_item.dart';
import '../models/catalog_section.dart';

// Component pages
import '../widgets/tpe_component_button_circle.dart';
import '../widgets/tpe_component_card_balance.dart';
import '../widgets/tpe_component_label.dart';
import '../widgets/tpe_component_menu_horizontal.dart';
import '../widgets/tpe_component_menu_vertical.dart';
import '../widgets/tpe_component_section.dart';
import '../widgets/tpe_component_header.dart';
import '../widgets/tpe_horizontal_menu_group.dart';


class ComponentCatalogScreen extends StatelessWidget {
  const ComponentCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = _buildSections();

    return Scaffold(
      appBar: AppBar(title: const Text("Component Catalog")),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return ExpansionTile(
            title: Text(section.title, style: const TextStyle(fontWeight: FontWeight.bold)),
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

  List<CatalogSection> _buildSections() {
    return [
      CatalogSection(
        title: "Atoms",
        items: [
          CatalogItem(label: "TPETextVariant", icon: Icons.label_important, destination: const TextVariant()),
          CatalogItem(label: "TPEBaseIcon", icon: Icons.label_important, destination: const BaseIcon()),
          CatalogItem(label: "TPEPromoCard", icon: Icons.label_important, destination: const BaseCard()),
          CatalogItem(label: "TPEEyeToggleButton", icon: Icons.label_important, destination: const EyeToggleButton()),
          CatalogItem(label: "TPECopyIcon", icon: Icons.label_important, destination: const CopyButton()),
          CatalogItem(label: "TPEBalanceIndicator", icon: Icons.label_important, destination: const TPEBalanceDot()),
          CatalogItem(label: "TPECountBadgeLabel", icon: Icons.label_important, destination: const TPECountBadgeLabel()),
          CatalogItem(label: "TPEColoredLabel", icon: Icons.label_important, destination: const TPEComponentLabelChip()),
          CatalogItem(label: "TPEMenuBadgeLabel", icon: Icons.label_important, destination: const MenuBadgeLabel()),
        ],
      ),
      CatalogSection(
        title: "Molecules",
        items: [
          CatalogItem(label: "TPEAccountCard", icon: Icons.account_balance_wallet, destination: const TPEComponentCardBalance()),
          CatalogItem(label: "TPECircleIconButton", icon: Icons.radio_button_checked, destination: const TPEComponentButtonCircle()),
          CatalogItem(label: "TPETransactionItem", icon: Icons.receipt_long, destination: const TransactionItem()),
          CatalogItem(label: "TPEMenuItemHorizontal", icon: Icons.dashboard_customize, destination: const TPEComponentMenuHorizontal()),
          CatalogItem(label: "TPEMenuItemVertical", icon: Icons.view_stream, destination: const TPEComponentMenuVertical()),
          CatalogItem(label: "TPESection", icon: Icons.view_week, destination: const TPEComponentSection()),
        ],
      ),
      CatalogSection(
        title: "Organisms",
        items: [
          CatalogItem(label: "TPEAccountHeader", icon: Icons.navigation, destination: const TPEComponentHeader()),
          CatalogItem(label: "TPEtTransactionList", icon: Icons.list, destination: const TransactionItemList()),
          CatalogItem(label: "TPEPromoSection", icon: Icons.local_activity, destination: const TPEOrganismPromoBanner()),
          CatalogItem(label: "TPEMenuIVertical", icon: Icons.vertical_split, destination: const TpeOrganismMenu()),
          CatalogItem(label: "TPEMenuHorizontal", icon: Icons.horizontal_split, destination: TPEComponentMenuHorizontalPage()),
        ],
      ),
    ];
  }
}

