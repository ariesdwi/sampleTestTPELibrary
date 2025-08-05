import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentInfoCardStorybook extends StatefulWidget {
  const TPEComponentInfoCardStorybook({super.key});

  @override
  State<TPEComponentInfoCardStorybook> createState() =>
      _TPEComponentInfoCardStorybookState();
}

class _TPEComponentInfoCardStorybookState
    extends State<TPEComponentInfoCardStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Info Card"),
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
                  name: 'TPEInfoCard / Default',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Title',
                      initial: 'Important Information',
                    );

                    final description1 = context.knobs.text(
                      label: 'Description 1',
                      initial: 'First line of description.',
                    );

                    final description2 = context.knobs.text(
                      label: 'Description 2',
                      initial: 'Second line of description.',
                    );

                    final backgroundColor = context.knobs.options<Color>(
                      label: 'Background Color',
                      initial: const Color(0xFFF3F4F6),
                      options: const [
                        Option(label: 'Light Grey', value: Color(0xFFF3F4F6)),
                        Option(label: 'White', value: Colors.white),
                        Option(label: 'Blue', value: Colors.blueAccent),
                      ],
                    );

                    final iconAsset = context.knobs.text(
                      label: 'Icon Asset Path',
                      initial: 'assets/images/info_filled.png',
                    );

                    return Center(
                      child: TPEInfoCard(
                        title: title,
                        descriptions: [description1, description2],
                        backgroundColor: backgroundColor,
                        iconAssetPath: iconAsset.isNotEmpty ? iconAsset : null,
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPEInfoCard(
                title: "Important Information",
                descriptions: [
                  "First line of description.",
                  "Second line of description.",
                ]
              ),
            ),
    );
  }
}
