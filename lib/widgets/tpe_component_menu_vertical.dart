import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentMenuVertical extends StatelessWidget {
  const TPEComponentMenuVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Menu Vertical")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TPEHomeMenuItemVertical(
              title: 'Transfer',
              icon: Icon(Icons.money, size: 28, color: Colors.blue),
              isNew: true,
              onTap: () {
                debugPrint('Transfer menu tapped!');
              },
            ),
            const SizedBox(height: 8),
             TPEHomeMenuItemVertical(
              title: 'Payment',
              icon: Icon(Icons.money, size: 28, color: Colors.blue),
              isNew: false,
              onTap: () {
                debugPrint('Transfer menu tapped!');
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
