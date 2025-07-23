import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentLabelChip extends StatefulWidget {
  const TPEComponentLabelChip({super.key});

  @override
  State<TPEComponentLabelChip> createState() => _TPEComponentLabelChipState();
}

class _TPEComponentLabelChipState extends State<TPEComponentLabelChip> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Label Chip"),
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
                  name: 'TPELabelChip / Customizable',
                  builder: (context) {
                    final label = context.knobs.text(
                      label: 'Label',
                      initial: 'Sukses',
                    );

                    final backgroundColor = context.knobs.options<Color>(
                      label: 'Background Color',
                      initial: const Color.fromRGBO(225, 248, 235, 1),
                      options: const [
                        Option(label: 'Green', value: Color(0xFFE1F8EB)),
                        Option(label: 'Red', value: Color(0xFFFFEBEB)),
                        Option(label: 'Blue', value: Color(0xFFE0F0FF)),
                      ],
                    );

                    final textColor = context.knobs.options<Color>(
                      label: 'Text Color',
                      initial: const Color.fromRGBO(39, 174, 96, 1),
                      options: const [
                        Option(label: 'Green', value: Color(0xFF27AE60)),
                        Option(label: 'Red', value: Color(0xFFEB5757)),
                        Option(label: 'Blue', value: Color(0xFF2D9CDB)),
                      ],
                    );

                    final borderRadiusValue = context.knobs
                        .slider(label: 'Border Radius', initial: 4, max: 32);

                    return TPELabelChip(
                      label: label,
                      backgroundColor: backgroundColor,
                      textColor: textColor,
                      borderRadius: BorderRadius.circular(borderRadiusValue),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  TPELabelChip(
                    label: 'Sukses',
                    backgroundColor: Color.fromRGBO(225, 248, 235, 1),
                    textColor: Color.fromRGBO(39, 174, 96, 1),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  SizedBox(height: 12),
                  TPELabelChip(
                    label: 'Gagal',
                    backgroundColor: Color.fromRGBO(255, 235, 235, 1),
                    textColor: Color.fromRGBO(235, 87, 87, 1),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ],
              ),
            ),
    );
  }
}


