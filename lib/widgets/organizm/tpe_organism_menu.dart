import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TpeOrganismMenu extends StatefulWidget {
  const TpeOrganismMenu({super.key});

  @override
  State<TpeOrganismMenu> createState() => _TpeOrganismMenuState();
}

class _TpeOrganismMenuState extends State<TpeOrganismMenu> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Menu"),
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
      backgroundColor: Colors.white,
      body: showStorybook
          ? Storybook(
              wrapperBuilder: (context, child) => Padding(
                padding: const EdgeInsets.all(16),
                child: Center(child: child),
              ),
              stories: [
                // ====== Full List Customizable ======
                Story(
                  name: 'TPEMenuListVertical / Custom List',
                  builder: (context) {
                    final itemCount = context.knobs
                        .slider(
                            label: 'Item Count', initial: 4, min: 1, max: 10)
                        .toInt();

                    final iconUrl = context.knobs.text(
                      label: 'Icon URL',
                      initial:
                          'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    );

                    final titlePrefix = context.knobs.text(
                      label: 'Title Prefix',
                      initial: 'Menu',
                    );

                    final iconSize = context.knobs.slider(
                        label: 'Icon Size', initial: 28, min: 12, max: 40);

                    final alternateNewBadges = context.knobs.boolean(
                      label: 'Alternate NEW badges',
                      initial: true,
                    );

                    return TPEMenuListVertical(
                      menuItems: List.generate(itemCount, (i) {
                        return TPEHomeMenuItemVertical(
                          title: '$titlePrefix ${i + 1}',
                          iconUrl: iconUrl,
                          iconSize: iconSize,
                          isNew: alternateNewBadges ? (i % 2 == 0) : false,
                          onTap: () => debugPrint('Tapped item: ${i + 1}'),
                        );
                      }),
                    );
                  },
                ),
              ],
            )
          : Container(
              margin: const EdgeInsets.all(16),
              child: TPEMenuListVertical(
                menuItems: [
                  TPEHomeMenuItemVertical(
                    title: 'Transfer',
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 28,
                    isNew: true,
                    onTap: () {
                      debugPrint('Transfer menu tapped!');
                    },
                  ),
                  TPEHomeMenuItemVertical(
                    title: 'Transfer International',
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 28,
                    isNew: false,
                    onTap: () {
                      debugPrint('Transfer International tapped!');
                    },
                  ),
                  TPEHomeMenuItemVertical(
                    title: 'Konversi Valas',
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 28,
                    isNew: false,
                    onTap: () {
                      debugPrint('Konversi Valas tapped!');
                    },
                  ),
                  TPEHomeMenuItemVertical(
                    title: 'Payment',
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 28,
                    isNew: false,
                    onTap: () {
                      debugPrint('Payment tapped!');
                    },
                  ),
                  TPEHomeMenuItemVertical(
                    title: 'Payment',
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/10384/10384161.png',
                    iconSize: 28,
                    isNew: false,
                    onTap: () {
                      debugPrint('Payment tapped again!');
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
