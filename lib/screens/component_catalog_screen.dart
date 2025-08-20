import 'package:flutter/material.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_balance_indicator.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_base_card.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_base_icon.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_copy_button.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_count_badge_label.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_eye_toggle_button.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_menu_badge_label.dart';
import 'package:hello_ios/widgets/molecule/tpe_molecule_app_bar.dart';
import 'package:hello_ios/widgets/molecule/tpe_molecule_confirmation_section.dart';
import 'package:hello_ios/widgets/molecule/tpe_molecule_navigation_card.dart';
import 'package:hello_ios/widgets/atoms/tpe_atom_text_variant.dart';
import 'package:hello_ios/widgets/molecule/tpe_molecule_primary_secondary_btn.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_card_balance.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_card_balance_tl.dart';

import 'package:hello_ios/widgets/organizm/tpe_organism_menu.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_primary_secondary_bs.dart';

import 'package:hello_ios/widgets/organizm/tpe_organism_promo.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_single_button_bs.dart';
import 'package:hello_ios/widgets/organizm/tpe_organism_transaction.dart';
import 'package:hello_ios/widgets/molecule/tpe_molecule_transaction_item.dart';
import '../models/catalog_item.dart';
import '../models/catalog_section.dart';

// Component pages
import '../widgets/molecule/tpe_molecule_button_circle.dart';
import '../widgets/atoms/tpe_atom_label.dart';
import '../widgets/molecule/tpe_molecule_menu_horizontal.dart';
import '../widgets/molecule/tpe_molecule_menu_vertical.dart';
import '../widgets/molecule/tpe_molecule_section.dart';
import '../widgets/organizm/tpe_organism_header.dart';
import '../widgets/organizm/tpe_organism_horizontal_menu_group.dart';
import '../widgets/molecule/tpe_molecule_text_field.dart';
import '../widgets/molecule/tpe_molecule_switch_language.dart';
import '../widgets/molecule/tpe_molecule_loading.dart';
import '../widgets/molecule/tpe_molecule_checkbox.dart';
import '../widgets/molecule/tpe_molecule_text_group.dart';
import '../widgets/atoms/tpe_atom_text_link.dart';
import '../widgets/molecule/tpe_molecule_button.dart';
import '../widgets/molecule/tpe_molecule_info_card.dart';
import '../widgets/molecule/tpe_molecule_language_title.dart';

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
            title: Text(section.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
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
          CatalogItem(
              label: "TPETextVariant",
              icon: Icons.label_important,
              destination: const TextVariant()),
          CatalogItem(
              label: "TPEBaseIcon",
              icon: Icons.label_important,
              destination: const BaseIcon()),
          CatalogItem(
              label: "TPEEyeToggleButton",
              icon: Icons.label_important,
              destination: const EyeToggleButton()),
          CatalogItem(
              label: "TPEBalanceIndicator",
              icon: Icons.label_important,
              destination: const TPEBalanceDot()),
          CatalogItem(
              label: "TPECountBadgeLabel",
              icon: Icons.label_important,
              destination: const TPECountBadgeLabel()),
          CatalogItem(
              label: "TPEColoredLabel",
              icon: Icons.label_important,
              destination: const TPEComponentLabelChip()),
          CatalogItem(
              label: "TPEMenuBadgeLabel",
              icon: Icons.label_important,
              destination: const MenuBadgeLabel()),
          CatalogItem(
              label: "TPEPromoCard",
              icon: Icons.label_important,
              destination: const BaseCard()),
          CatalogItem(
              icon: Icons.label_important,
              label: "TPETextLink",
              destination: TPEComponentLinkTextStorybook()),
          // CatalogItem(label: "TPEBaseCardBalance", icon: Icons.label_important, destination: const BalanceBaseCard()),
          //Login
          // CatalogItem(
          //     label: "TPETextField",
          //     icon: Icons.label_important,
          //     destination: TPEAtomTextField()),

          CatalogItem(
              label: "TPERefineButton",
              icon: Icons.label_important,
              destination: const TPEComponentButtonStorybook()),
        ],
      ),
      CatalogSection(
        title: "Molecules",
        items: [
          CatalogItem(
              label: "TPECopyIcon",
              icon: Icons.label_important,
              destination: const CopyButton()),
          CatalogItem(
              label: "TPENavigationCardButton",
              icon: Icons.label_important,
              destination: const NavigationButtonCard()),
          CatalogItem(
              label: "TPECircleIconButton",
              icon: Icons.radio_button_checked,
              destination: const TPEComponentButtonCircle()),
          CatalogItem(
              label: "TPETransactionItem",
              icon: Icons.receipt_long,
              destination: const TransactionItem()),
          CatalogItem(
              label: "TPEMenuItemHorizontal",
              icon: Icons.dashboard_customize,
              destination: const TPEComponentMenuHorizontal()),
          CatalogItem(
              label: "TPEMenuItemVertical",
              icon: Icons.view_stream,
              destination: const TPEComponentMenuVertical()),
          CatalogItem(
              label: "TPESection",
              icon: Icons.view_week,
              destination: const TPEComponentSection()),
          //Login
          CatalogItem(
              label: "TPEInputTextField",
              icon: Icons.label_important,
              destination: const TPEComponentInputTextFieldStorybook()),
          CatalogItem(
              label: "TPESwitchLanguage",
              icon: Icons.label_important,
              destination: const TPESwitchLanguageStorybook()),
              CatalogItem(icon: Icons.label_important, label: "TPEPrimarySecondaryButton", destination: TpeMoleculePrimarySecondaryBtn()),
          CatalogItem(
              label: "TPETextGroup",
              icon: Icons.label_important,
              destination: const TPEComponentTextGroupStorybook()),
              CatalogItem(
              label: "TPEConfirmationSection",
              icon: Icons.label_important,
              destination: const TpeMoleculeConfirmationSection()),
          CatalogItem(
              label: "TPEInfoCard",
              icon: Icons.label_important,
              destination: const TPEComponentInfoCardStorybook()),
          CatalogItem(
              label: "TPECheckedText",
              icon: Icons.label_important,
              destination: const TPEComponentCheckedTextStorybook()),
          CatalogItem(
              label: "TPELoadingCircularBar",
              icon: Icons.label_important,
              destination: const TPEComponentLoadingCircularBarStorybook()),
          CatalogItem(
              label: "TPELanguageItemTile",
              icon: Icons.label_important,
              destination: const TPEComponentLanguageItemTileStorybook()),
          CatalogItem(
              icon: Icons.label_important,
              label: "TPEAppBar",
              destination: const TpeMoleculeAppBar()),
        ],
      ),
      CatalogSection(
        title: "Organisms",
        items: [
          CatalogItem(
              label: "TPEAccountHeader",
              icon: Icons.navigation,
              destination: const TPEComponentHeader()),
          CatalogItem(
              label: "TPEAccountCardTL",
              icon: Icons.account_balance_wallet,
              destination: const TPEComponentCardBalanceTL()),
          CatalogItem(
              label: "TPEAccountCardTW",
              icon: Icons.account_balance_wallet,
              destination: const TPEComponentCardBalanceTW()),
          CatalogItem(
              label: "TPETransactionList",
              icon: Icons.list,
              destination: const TransactionItemList()),
          CatalogItem(
              label: "TPEPromoSection",
              icon: Icons.local_activity,
              destination: const TPEOrganismPromoBanner()),
          CatalogItem(
              label: "TPEMenuIVertical",
              icon: Icons.vertical_split,
              destination: const TpeOrganismMenu()),
          CatalogItem(
              label: "TPEMenuHorizontal",
              icon: Icons.horizontal_split,
              destination: TPEComponentMenuHorizontalPage()),
          //Login
          CatalogItem(
              label: "TPESingleButtonBottomSheet",
              icon: Icons.menu,
              destination: const TpeOrganismSingleButtonBottomSheet()),
          CatalogItem(
              label: "TPEPrimarySecondaryBottomSheet",
              icon: Icons.menu,
              destination: const TpeOrganismPrimarySecondaryBs()),
        ],
      ),
    ];
  }
}
