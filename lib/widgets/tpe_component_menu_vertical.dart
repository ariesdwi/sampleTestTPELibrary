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
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
              iconSize: 20,
              isNew: true,
              onTap: () {
                debugPrint('Transfer menu tapped!');
              },
            ),
            const SizedBox(height: 8),
             TPEHomeMenuItemVertical(
              title: 'Payment',
              iconUrl: 'https://cdn-icons-png.flaticon.com/512/4256/4256863.png',
              iconSize: 20,
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
