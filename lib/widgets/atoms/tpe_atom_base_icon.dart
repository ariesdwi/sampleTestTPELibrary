// import 'package:flutter/material.dart';
// import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/icon/tpe_icon_base.dart';

class BaseIcon extends StatefulWidget {
  const BaseIcon({super.key});

  @override
  State<BaseIcon> createState() => _BaseIconStorybookState();
}

class _BaseIconStorybookState extends State<BaseIcon> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Base Icon"),
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
                  name: 'TPEBaseIconUrl / Customizable',
                  builder: (context) {
                    final iconUrl = context.knobs.text(
                      label: 'Icon URL',
                      initial:
                          'https://cdn-icons-png.flaticon.com/512/3449/3449748.png',
                    );

                    final size = context.knobs.slider(
                      label: 'Size',
                      initial: 40,
                      min: 20,
                      max: 100,
                    );

                    // final color = context.knobs.options<Color>(
                    //   label: 'Color',
                    //   initial: Colors.blue,
                    //   options: const [
                    //     Option(label: 'Blue', value: Colors.blue),
                    //     Option(label: 'Red', value: Colors.red),
                    //     Option(label: 'Green', value: Colors.green),
                    //     Option(label: 'Black', value: Colors.black),
                    //     Option(label: 'Grey', value: Colors.grey),
                    //   ],
                    // );

                    return TPEBaseIconUrl(iconUrl: iconUrl, size: size);
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  TPEBaseIconUrl(
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/3449/3449748.png',
                    size: 40,
                  ),
                  SizedBox(height: 8),
                  TPEBaseIconUrl(
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/3186/3186949.png',
                    size: 40,
                  ),
                  SizedBox(height: 8),
                  TPEBaseIconUrl(
                    iconUrl:
                        'https://cdn-icons-png.flaticon.com/512/18717/18717283.png',
                    size: 40,
                  ),
                ],
              ),
            ),
    );
  }
}
