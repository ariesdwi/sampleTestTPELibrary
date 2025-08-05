import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
// if this is where TPECheckedText is located

class TPEComponentCheckedTextStorybook extends StatefulWidget {
  const TPEComponentCheckedTextStorybook({super.key});

  @override
  State<TPEComponentCheckedTextStorybook> createState() =>
      _TPEComponentCheckedTextStorybookState();
}

class _TPEComponentCheckedTextStorybookState
    extends State<TPEComponentCheckedTextStorybook> {
  bool showStorybook = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Checked Text"),
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
                  name: 'TPECheckedText / Default',
                  builder: (context) {
                    final label = context.knobs.text(
                      label: 'Label Text',
                      initial: 'I agree to the terms and conditions',
                    );

                    final activeColor = context.knobs.options<Color>(
                      label: 'Active Color',
                      initial: Colors.blue,
                      options: const [
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Grey', value: Colors.grey),
                      ],
                    );

                    final checkColor = context.knobs.options<Color>(
                      label: 'Check Color',
                      initial: Colors.white,
                      options: const [
                        Option(label: 'White', value: Colors.white),
                        Option(label: 'Black', value: Colors.black),
                        Option(label: 'Yellow', value: Colors.yellow),
                      ],
                    );

                    final isChecked = context.knobs.boolean(
                      label: 'Checked',
                      initial: false,
                    );

                    return StatefulBuilder(
                      builder: (context, setState) {
                        return TPECheckedText(
                          value: isChecked,
                          text: label,
                          activeColor: activeColor,
                          checkColor: checkColor,
                          onChanged: (val) => setState(() {
                            context.knobs.boolean(
                              label: 'Checked',
                              initial: val,
                            ); 
                          }),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          : Center(
              child: TPECheckedText(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val;
                });
              },
              text: "Saya menyetujui syarat dan ketentuan",
            )),
    );
  }
}
