
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEBalanceDot extends StatefulWidget {
  const TPEBalanceDot({super.key});

  @override
  State<TPEBalanceDot> createState() => _TPEBalanceDotStorybookState();
}

class _TPEBalanceDotStorybookState extends State<TPEBalanceDot> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Balance Indicator"),
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
                  name: 'TPEBalanceIndicator / Customizable',
                  builder: (context) {
                    final itemCount = context.knobs
                        .slider(label: 'Item Count', initial: 5, min: 1, max: 10)
                        .toInt();

                    final size = context.knobs
                        .slider(label: 'Dot Size', initial: 12, min: 4, max: 30);

                    final spacing = context.knobs
                        .slider(label: 'Spacing', initial: 8, min: 0, max: 30);

                    final color = context.knobs.options<Color>(
                      label: 'Color',
                      initial: TPEColors.blue80,
                      options: const [
                        Option(label: 'Blue', value: TPEColors.blue80),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Orange', value: Colors.orange),
                        Option(label: 'Grey', value: Colors.grey),
                      ],
                    );

                    return TPEBalanceIndicator(
                      itemCount: itemCount,
                      size: size,
                      spacing: spacing,
                      color: color,
                    );
                  },
                ),
              ],
            )
          : const Center(
              child: TPEBalanceIndicator(),
            ),
    );
  }
}

