
import 'package:flutter/material.dart';
import 'package:hello_ios/widgets/atoms/tpe_balance_indicator.dart';
import 'package:hello_ios/widgets/atoms/tpe_base_card.dart';
import 'package:hello_ios/widgets/atoms/tpe_base_icon.dart';
import 'package:hello_ios/widgets/atoms/tpe_copy_button.dart';
import 'package:hello_ios/widgets/atoms/tpe_count_badge_label.dart';
import 'package:hello_ios/widgets/atoms/tpe_eye_toggle_button.dart';
import 'package:hello_ios/widgets/atoms/tpe_menu_badge_label.dart';
import 'package:hello_ios/widgets/atoms/tpe_text_variant.dart';
import 'package:hello_ios/widgets/tpe_transaction_item.dart';
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
          CatalogItem(label: "TPETextVariant", icon: Icons.text_fields, destination: const TextVariant()),
          CatalogItem(label: "TPEBaseIcon", icon: Icons.copy, destination: const BaseIcon()),
          CatalogItem(label: "TPEBaseCard", icon: Icons.arrow_forward, destination: const BaseCard()),
          CatalogItem(label: "TPEEyeToggleButton", icon: Icons.remove_red_eye, destination: const EyeToggleButton()),
          CatalogItem(label: "TPECopyIcon", icon: Icons.star, destination: const CopyButton()),
          CatalogItem(label: "TPEBalanceIndicator", icon: Icons.label_important, destination: const TPEBalanceDot()),
          CatalogItem(label: "TPECountBadgeLabel", icon: Icons.text_fields, destination: const TPECountBadgeLabel()),
          CatalogItem(label: "TPEColoredLabel", icon: Icons.text_fields, destination: const TPEComponentLabelChip()),
          CatalogItem(label: "TPEMenuBadgeLabel", icon: Icons.notifications, destination: const MenuBadgeLabel()),
        ],
      ),
      CatalogSection(
        title: "Molecules",
        items: [
          CatalogItem(label: "TPEAccountCard", icon: Icons.account_balance_wallet, destination: const TPEComponentCardBalance()),
          CatalogItem(label: "TPECircleIconButton", icon: Icons.radio_button_checked, destination: const TPEComponentButtonCircle()),
          CatalogItem(label: "TPETransactionItem", icon: Icons.receipt_long, destination: const TransactionItem()),
          CatalogItem(label: "TPEPromoBanner", icon: Icons.local_offer),
          CatalogItem(label: "TPEMenuItemHorizontal", icon: Icons.dashboard_customize, destination: const TPEComponentMenuHorizontal()),
          CatalogItem(label: "TPEMenuItemVertical", icon: Icons.view_stream, destination: const TPEComponentMenuVertical()),
        ],
      ),
      CatalogSection(
        title: "Organisms",
        items: [
          CatalogItem(label: "TPEAccountHeader", icon: Icons.navigation, destination: const TPEComponentHeader()),
          CatalogItem(label: "TPERencentTransactionList", icon: Icons.list),
          CatalogItem(label: "TPEPromoSection", icon: Icons.local_activity),
          CatalogItem(label: "TPEMenuIVertical", icon: Icons.vertical_split),
          CatalogItem(label: "TPEMenuHorizontal", icon: Icons.horizontal_split, destination: TPEComponentMenuHorizontalPage()),
          
          CatalogItem(label: "TPESection", icon: Icons.view_week, destination: const TPEComponentSection()),
        ],
      ),
    ];
  }
}

