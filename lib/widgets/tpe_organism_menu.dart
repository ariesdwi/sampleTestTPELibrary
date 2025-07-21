
import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/menu/tpe_component_menu_vertical.dart';
import 'package:tpe_component_sdk/components/menu/tpe_homepage_transaction_tw.dart';

class TpeOrganismMenu extends StatelessWidget {
  const TpeOrganismMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TpeMenuTransactionTw(
        menuItems: [
          TPEHomeMenuItemVertical(
            icon: const Icon(Icons.send),
            title: 'Transfer',
            onTap: () => debugPrint("Transfer tapped"),
          ),
      
          TPEHomeMenuItemVertical(
            icon: const Icon(Icons.send),
            title: 'Transfer International',
            onTap: () => debugPrint("Transfer tapped"),
          ),
      
          TPEHomeMenuItemVertical(
            icon: const Icon(Icons.send),
            title: 'Konversi Valas',
            onTap: () => debugPrint("Transfer tapped"),
          ),
      
          TPEHomeMenuItemVertical(
            icon: const Icon(Icons.send),
            title: 'Penerimaan Negara',
            onTap: () => debugPrint("Transfer tapped"),
          ),
        ],
      ),
    );
  }
}