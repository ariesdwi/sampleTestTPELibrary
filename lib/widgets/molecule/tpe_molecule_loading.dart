import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentLoadingCircularBarStorybook extends StatefulWidget {
  const TPEComponentLoadingCircularBarStorybook({super.key});

  @override
  State<TPEComponentLoadingCircularBarStorybook> createState() =>
      _TPEComponentLoadingCircularBarStorybookState();
}

class _TPEComponentLoadingCircularBarStorybookState
    extends State<TPEComponentLoadingCircularBarStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Loading Circular Bar"),
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
                  name: 'TPELoadingCircularBar / Default',
                  builder: (context) {
                    final type = context.knobs.options<TPELoadingType>(
                      label: 'Loading Type',
                      initial: TPELoadingType.circularWhite,
                      options: const [
                        Option(label: 'Circular White', value: TPELoadingType.circularWhite),
                        Option(label: 'Three Dot Blue', value: TPELoadingType.threeDotBlue),
                      ],
                    );

                    final label = context.knobs.text(
                      label: 'Label',
                      initial: 'Loading...',
                    );

                    final canPop = context.knobs.boolean(
                      label: 'Can Pop',
                      initial: true,
                    );

                    return Container(
                      color: type == TPELoadingType.circularWhite
                          ? TPEColors.primaryBlue
                          : Colors.white,
                      child: TPELoadingCircularBar(
                        type: type,
                        label: label.isNotEmpty ? label : null,
                        canPop: canPop,
                      ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Container(
                color: TPEColors.primaryBlue,
                padding: const EdgeInsets.all(32),
                child: const TPELoadingCircularBar(
                  type: TPELoadingType.circularWhite,
                  label: "Loading...",
                  canPop: true,
                ),
              ),
            ),
    );
  }
}
