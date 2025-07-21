import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/menu/tpe_component_menu_vertical.dart';
import 'package:tpe_component_sdk/components/menu/tpe_homepage_transaction_tw.dart';

class TpeOrganismMenu extends StatelessWidget {
  const TpeOrganismMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Menu")),
      backgroundColor: Colors.white, // <- Tambahkan ini kalau tetap gelap
      body: Container(
        margin: EdgeInsets.all(16),
        child: TpeMenuTransactionTw(
          menuItems: [
            TPEHomeMenuItemVertical(
              title: 'Transfer',
              icon: Icon(Icons.money, size: 28, color: Colors.blue),
              isNew: true,
              onTap: () {
                debugPrint('Transfer menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Transfer International',
              icon: Icon(Icons.money, size: 28, color: Colors.blue),
              isNew: false,
              onTap: () {
                debugPrint('Payment menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Konversi Valas ',
              icon: Icon(Icons.money, size: 28, color: Colors.blue),
              isNew: false,
              onTap: () {
                debugPrint('Payment menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Payment',
              icon: Icon(Icons.money, size: 28, color: Colors.blue),
              isNew: false,
              onTap: () {
                debugPrint('Payment menu tapped!');
              },
            ),
            TPEHomeMenuItemVertical(
              title: 'Payment',
              icon: Icon(Icons.money, size: 28, color: Colors.blue),
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
