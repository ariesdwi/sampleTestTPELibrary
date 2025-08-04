import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/button/tpe_navigation_card.dart';

class NavigationButtonCard extends StatefulWidget {
  const NavigationButtonCard({super.key});

  @override
  State<NavigationButtonCard> createState() => _NavigationButtonCardState();
}

class _NavigationButtonCardState extends State<NavigationButtonCard> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Navigation Card Button"),
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
      body: showStorybook ? _buildStorybook() : _buildDefaultButton(),
    );
  }

  Widget _buildDefaultButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TPENavigationCardButton(
          text: 'Lihat semua rekeningmu',
          onTap: () {
            debugPrint("Navigation card tapped");
          },
        ),
      ),
    );
  }

  Widget _buildStorybook() {
    return Storybook(
      wrapperBuilder: (context, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: child),
      ),
      stories: [
        Story(
          name: 'TPENavigationCardButton / Customizable',
          builder: (context) {
            final text = context.knobs.text(
              label: 'Button Text',
              initial: 'Lihat semua rekeningmu',
            );

            final enabled = context.knobs.boolean(
              label: 'Enable Tap Handler',
              initial: true,
            );

            return TPENavigationCardButton(
              text: text,
              onTap: () {
                if (enabled) {
                  debugPrint("Card tapped");
                }
              },
            );
          },
        ),
      ],
    );
  }
}
