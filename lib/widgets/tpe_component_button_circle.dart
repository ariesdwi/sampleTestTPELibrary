import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/button/tpe_component_circle_button.dart';

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
            TPECircleIconButton(
              icon: Icons.logout,
              onPressed: () {
                debugPrint("Cart pressed!");
              },
            ),
            const SizedBox(height: 8),
            TPECircleIconButton(
              icon: Icons.notifications_outlined,
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
