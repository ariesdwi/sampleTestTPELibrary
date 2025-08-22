import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentMenuVertical extends StatefulWidget {
  const TPEComponentMenuVertical({super.key});

  @override
  State<TPEComponentMenuVertical> createState() =>
      _TPEComponentMenuVerticalState();
}

class _TPEComponentMenuVerticalState extends State<TPEComponentMenuVertical> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Menu Vertical"),
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
                // ====== LIST VARIANT ======
                Story(
                  name: 'TPEHomeMenuItemVertical / List (Customizable)',
                  builder: (context) {
                    final itemCount = context.knobs
                        .slider(
                            label: 'Item Count', initial: 4, min: 1, max: 10)
                        .toInt();

                    final spacing = context.knobs
                        .slider(label: 'Spacing', initial: 8, min: 0, max: 32);

                    final iconSize = context.knobs.slider(
                        label: 'Icon Size', initial: 20, min: 12, max: 40);

                    final titlePrefix = context.knobs
                        .text(label: 'Title Prefix', initial: 'Menu');

                    final iconUrl = context.knobs.text(
                      label: 'Icon URL',
                      initial:
                          'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    );

                    final alternateNewBadges = context.knobs.boolean(
                      label: 'Alternate NEW badges',
                      initial: true,
                    );

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < itemCount; i++) ...[
                          TPEHomeMenuItemVertical(
                            title: '$titlePrefix ${i + 1}',
                            iconUrl: iconUrl,
                            iconSize: iconSize,
                            isNew: alternateNewBadges ? (i % 2 == 0) : false,
                            onTap: () => debugPrint(
                              'Menu tapped: ${i + 1}',
                            ),
                          ),
                          if (i < itemCount - 1) SizedBox(height: spacing),
                        ],
                      ],
                    );
                  },
                ),

                // ====== SINGLE ITEM VARIANT ======
                Story(
                  name: 'TPEHomeMenuItemVertical / Single (Customizable)',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Title',
                      initial: 'Transfer',
                    );

                    final iconUrl = context.knobs.text(
                      label: 'Icon URL',
                      initial:
                          'https://cdn-icons-png.flaticon.com/512/4256/4256863.png',
                    );

                    final iconSize = context.knobs.slider(
                        label: 'Icon Size', initial: 20, min: 12, max: 40);

                    final isNew = context.knobs
                        .boolean(label: 'Show NEW badge', initial: false);

                    return TPEHomeMenuItemVertical(
                      title: title,
                      iconUrl: iconUrl,
                      iconSize: iconSize,
                      isNew: isNew,
                      onTap: () => debugPrint('Single item tapped!'),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TPEHomeMenuItemVertical(
                    title: 'Transfer',
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 20,
                    isNew: true,
                    onTap: () => debugPrint('Transfer menu tapped!'),
                  ),
                  const SizedBox(height: 8),
                  TPEHomeMenuItemVertical(
                    title: 'Payment',
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/4256/4256863.png',
                    iconSize: 20,
                    isNew: false,
                    onTap: () => debugPrint('Payment menu tapped!'),
                  ),
                ],
              ),
            ),
    );
  }
}
