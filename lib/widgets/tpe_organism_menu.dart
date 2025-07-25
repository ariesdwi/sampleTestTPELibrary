import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/menu/tpe_component_menu_vertical.dart';
import 'package:tpe_component_sdk/components/menu/tpe_homepage_transaction_tw.dart';

class TpeOrganismMenu extends StatelessWidget {
  const TpeOrganismMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Menu")),
      backgroundColor: Colors.white, 
      body: Container(
        margin: EdgeInsets.all(16),
        child: TPEMenuListVertical(
          menuItems: [
            TPEHomeMenuItemVertical(
              title: 'Transfer',
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
              iconSize: 28,
              isNew: true,
              onTap: () {
                debugPrint('Transfer menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Transfer International',
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
              iconSize: 28,
              isNew: false,
              onTap: () {
                debugPrint('Payment menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Konversi Valas ',
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
              iconSize: 28,
              isNew: false,
              onTap: () {
                debugPrint('Payment menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Payment',
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
              iconSize: 28,
              isNew: false,
              onTap: () {
                debugPrint('Payment menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Payment',
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
              iconSize: 28,
              isNew: false,
              onTap: () {
                debugPrint('Payment menu tapped!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
