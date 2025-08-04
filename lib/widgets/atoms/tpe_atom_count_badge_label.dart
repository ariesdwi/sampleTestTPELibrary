import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/icon/tpe_count_badge_icon.dart';

class TPECountBadgeLabel extends StatefulWidget {
  const TPECountBadgeLabel({super.key});

  @override
  State<TPECountBadgeLabel> createState() => _TPECountBadgeLabelStorybookState();
}

class _TPECountBadgeLabelStorybookState extends State<TPECountBadgeLabel> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Badge Count Label"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              setState(() {
                showStorybook = !showStorybook;
              });
            },
          ),
        ],
      ),
      body: showStorybook
          ? Storybook(
              wrapperBuilder: (context, child) => Center(child: child),
              stories: [
                Story(
                  name: 'TPECountBadgeIcon / Customizable',
                  builder: (context) {
                    final badgeCountText = context.knobs.text(
                      label: 'Badge Count (number)',
                      initial: '3',
                    );

                    final badgeCount = int.tryParse(badgeCountText) ?? 0;

                    return TPECountBadgeIcon(badgeCount: badgeCount);
                  },
                ),
              ],
            )
          : Center(
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

