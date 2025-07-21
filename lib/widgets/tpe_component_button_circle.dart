import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentButtonCircle extends StatefulWidget {
  const TPEComponentButtonCircle({super.key});

  @override
  State<TPEComponentButtonCircle> createState() =>
      _TPEComponentButtonCircleState();
}

class _TPEComponentButtonCircleState extends State<TPEComponentButtonCircle> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Circle Icon Button"),
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
                  name: 'TPECircleIconButton / Customizable',
                  builder: (context) {
                    final icon = context.knobs.options<IconData>(
                      label: 'Icon',
                      initial: Icons.logout,
                      options: const [
                        Option(label: 'Logout', value: Icons.logout),
                        Option(label: 'Cart', value: Icons.shopping_cart),
                        Option(label: 'Notif', value: Icons.notifications),
                        Option(label: 'Setting', value: Icons.settings),
                      ],
                    );

                    final badgeCount = context.knobs.sliderInt(
                      label: 'Badge Count',
                      initial: 0,
                      max: 10,
                    );

                    final backgroundColor = context.knobs.options<Color>(
                      label: 'Background Color',
                      initial: Colors.blue,
                      options: const [
                        Option(label: 'TPEColorBlue', value: TPEColors.blue80),
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Grey', value: Colors.grey),
                      ],
                    );

                    return TPECircleIconButton(
                      icon: icon,
                      badgeCount: badgeCount > 0 ? badgeCount : null,
                      backgroundColor: backgroundColor,
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Button pressed from Storybook"),
                            ),
                          ),
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TPECircleIconButton(
                    icon: Icons.logout,
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Logout Button pressed"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TPECircleIconButton(
                    icon: Icons.notifications_outlined,
                    badgeCount: 3,
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Notification Button pressed"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
