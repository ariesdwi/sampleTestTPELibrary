import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentLanguageItemTileStorybook extends StatefulWidget {
  const TPEComponentLanguageItemTileStorybook({super.key});

  @override
  State<TPEComponentLanguageItemTileStorybook> createState() =>
      _TPEComponentLanguageItemTileStorybookState();
}

class _TPEComponentLanguageItemTileStorybookState
    extends State<TPEComponentLanguageItemTileStorybook> {
  bool showStorybook = false;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Language Item Tile"),
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
              wrapperBuilder: (context, child) =>
                  Padding(padding: const EdgeInsets.all(16), child: child),
              stories: [
                Story(
                  name: 'TPELanguageItemTile / Default',
                  builder: (context) {
                    final languageName = context.knobs.text(
                      label: 'Language Name',
                      initial: 'English',
                    );

                    final languageCode = context.knobs.text(
                      label: 'Language Code',
                      initial: 'US',
                    );

                    final isSelected = context.knobs.boolean(
                      label: 'Selected',
                      initial: false,
                    );

                    return Center(
                      child: TPELanguageItemTile(
                        languageName: languageName,
                        languageCode: languageCode,
                        isSelected: isSelected,
                        onTap: () {}, // No-op for demo
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPELanguageItemTile(
              languageCode: 'id',
              languageName: 'Bahasa Indonesia',
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            )),
    );
  }
}
