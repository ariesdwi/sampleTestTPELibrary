import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/button/tpe_eye_toggle_button.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class EyeToggleButton extends StatefulWidget {
  const EyeToggleButton({super.key});

  @override
  State<EyeToggleButton> createState() => _EyeToggleButtonStorybookState();
}

class _EyeToggleButtonStorybookState extends State<EyeToggleButton> {
  bool showStorybook = false;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Eye Toggle Button"),
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
                  name: 'TPEEyeToggleButton / Customizable',
                  builder: (context) {
                    final visible = context.knobs.boolean(
                      label: 'Visible',
                      initial: true,
                    );

                    final color = context.knobs.options<Color>(
                      label: 'Color',
                      initial: TPEColors.blue80,
                      options: const [
                        Option(label: 'Blue', value: TPEColors.blue80),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Black', value: Colors.black),
                      ],
                    );

                    return TPEEyeToggleButton(
                      visible: visible,
                      onTap: () {
                        context.knobs.boolean(label: 'Visible', initial: !visible);
                      },
                      color: color,
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TPEEyeToggleButton(
                    visible: true,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Eye visible tapped")),
                      );
                    },
                    color: TPEColors.blue80,
                  ),
                  const SizedBox(height: 16),
                  TPEEyeToggleButton(
                    visible: false,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Eye hidden tapped")),
                      );
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
    );
  }
}
