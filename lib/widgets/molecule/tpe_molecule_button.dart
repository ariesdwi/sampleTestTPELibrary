import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart'; // import your button file here

class TPEComponentButtonStorybook extends StatefulWidget {
  const TPEComponentButtonStorybook({super.key});

  @override
  State<TPEComponentButtonStorybook> createState() =>
      _TPEComponentButtonStorybookState();
}

class _TPEComponentButtonStorybookState
    extends State<TPEComponentButtonStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Refine Button"),
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
                  name: 'TPERefineButton / Customizable',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Title',
                      initial: 'Simpan',
                    );

                    final icon = context.knobs.options<IconData?>(
                      label: 'Icon',
                      initial: Icons.save,
                      options: const [
                        Option(label: 'Save', value: Icons.save),
                        Option(label: 'Edit', value: Icons.edit),
                        Option(label: 'Delete', value: Icons.delete),
                        Option(label: 'None', value: null),
                      ],
                    );

                    final variant = context.knobs.options<TPEButtonVariant>(
                      label: 'Variant',
                      initial: TPEButtonVariant.primary,
                      options: const [
                        Option(
                            label: 'Primary', value: TPEButtonVariant.primary),
                        Option(
                            label: 'Outline', value: TPEButtonVariant.outline),
                        Option(
                            label: 'Secondary',
                            value: TPEButtonVariant.secondary),
                        Option(label: 'Plain', value: TPEButtonVariant.plain),
                      ],
                    );

                    final size = context.knobs.options<TPEButtonSize>(
                      label: 'Size',
                      initial: TPEButtonSize.medium,
                      options: const [
                        Option(label: 'Small', value: TPEButtonSize.small),
                        Option(label: 'Medium', value: TPEButtonSize.medium),
                      ],
                    );

                    final roundType = context.knobs.options<TPEButtonRound>(
                      label: 'Round Type',
                      initial: TPEButtonRound.pill,
                      options: const [
                        Option(label: 'None', value: TPEButtonRound.none),
                        Option(label: 'Rounded', value: TPEButtonRound.rounded),
                        Option(label: 'Pill', value: TPEButtonRound.pill),
                      ],
                    );

                    final isCentered = context.knobs.boolean(
                      label: 'Centered',
                      initial: true,
                    );

                    final isLoading = context.knobs.boolean(
                      label: 'Loading',
                      initial: false,
                    );

                    final isEnabled = context.knobs.boolean(
                      label: 'Enabled',
                      initial: true,
                    );

                    return TPERefineButton(
                      title: title,
                      icon: icon,
                      variant: variant,
                      size: size,
                      roundType: roundType,
                      isCentered: isCentered,
                      isLoading: isLoading,
                      isEnabled: isEnabled,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Refine Button Pressed"),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPERefineButton(
                title: "Simpan",
                icon: Icons.save,
                variant: TPEButtonVariant.primary,
                size: TPEButtonSize.medium,
                roundType: TPEButtonRound.pill,
                isCentered: true,
                isEnabled: true,
                isLoading: false,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Simpan pressed!")),
                  );
                },
              ),
            ),
    );
  }
}
