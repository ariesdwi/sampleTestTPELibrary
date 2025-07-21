import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/icon/tpe_count_badge_icon.dart';

class TPECountBadgeLabel extends StatelessWidget {
  const TPECountBadgeLabel({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Badge Count Label")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TPECountBadgeIcon(badgeCount: 1),
            TPECountBadgeIcon(badgeCount: 2),
            TPECountBadgeIcon(badgeCount: 3),
            TPECountBadgeIcon(badgeCount: 4),
            TPECountBadgeIcon(badgeCount: 5),
            TPECountBadgeIcon(badgeCount: 6),
            TPECountBadgeIcon(badgeCount: 7),
          ],
        ),
      ),
    );
  }
}
