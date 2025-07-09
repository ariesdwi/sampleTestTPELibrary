import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentMenuHorizontal extends StatelessWidget {
  const TPEComponentMenuHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Menu Horizontal")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TPEHorizontalMenuItem(
              icon: Icon(Icons.attach_money, color: Colors.blue),
              title: 'Transfer',
              subtitle: 'Transfer money securely to any domestic bank account',
              onTap: () {
                debugPrint('Transfer tapped');
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
