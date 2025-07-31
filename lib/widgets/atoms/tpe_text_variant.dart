import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TextVariant extends StatefulWidget {
  const TextVariant({super.key});

  @override
  State<TextVariant> createState() => _TPETextStorybookState();
}

class _TPETextStorybookState extends State<TextVariant> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPEText Storybook"),
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
                  name: 'TPEText / Customizable',
                  builder: (context) {
                    final text = context.knobs.text(
                      label: 'Text',
                      initial: 'Hello, TPE!',
                    );

                    final variant = context.knobs.options<TPETextVariant>(
                      label: 'Text Variant',
                      initial: TPETextVariant.primary,
                      options: const [
                        Option(label: 'Primary', value: TPETextVariant.primary),
                        Option(label: 'Secondary', value: TPETextVariant.secondary),
                        Option(label: '12 Bold', value: TPETextVariant.text12bold),
                        Option(label: '14 SemiBold 600', value: TPETextVariant.text14SemiBold600),
                        Option(label: '14 SemiBold 700', value: TPETextVariant.text14SemiBold700),
                        Option(label: '16 SemiBold 600', value: TPETextVariant.text16SemiBold600),
                        Option(label: '16 Bold', value: TPETextVariant.text16Bold),
                        Option(label: '20 SemiBold 700', value: TPETextVariant.text20SemiBold700),
                      ],
                    );

                    final color = context.knobs.options<Color>(
                      label: 'Text Color',
                      initial: Colors.black,
                      options: const [
                        Option(label: 'Black', value: Colors.black),
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Grey', value: Colors.grey),
                      ],
                    );

                    return TPEText(
                      text: text,
                      variant: variant,
                      color: color,
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  TPEText(text: "Primary"),
                  TPEText(text: "Secondary", variant: TPETextVariant.secondary),
                  TPEText(text: "12 Bold", variant: TPETextVariant.text12bold),
                  TPEText(
                    text: "14 SemiBold 600",
                    variant: TPETextVariant.text14SemiBold600,
                    color: TPEColors.blue80,
                  ),
                  TPEText(text: "14 SemiBold 700", variant: TPETextVariant.text14SemiBold700),
                  TPEText(text: "16 SemiBold 600", variant: TPETextVariant.text16SemiBold600),
                  TPEText(text: "16 Bold", variant: TPETextVariant.text16Bold),
                  TPEText(text: "20 SemiBold 700", variant: TPETextVariant.text20SemiBold700),
                ],
              ),
            ),
    );
  }
}
