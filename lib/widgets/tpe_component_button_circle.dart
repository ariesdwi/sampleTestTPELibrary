import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentButtonCircle extends StatelessWidget {
  const TPEComponentButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Circle Icon Button")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleIconButton(
              icon: Icons.shopping_cart,
              onPressed: () {
                debugPrint("Cart pressed!");
              },
            ),
            const SizedBox(height: 8),
            CircleIconButton(
              icon: Icons.notifications,
              badgeCount: 3,
              onPressed: () {
                debugPrint("Notifications pressed!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
