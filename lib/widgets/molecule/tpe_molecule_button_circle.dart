import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TPE Circle Icon Button Storybook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TPEComponentButtonCircle(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Storybook implementation using your TPE Component SDK
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
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(showStorybook ? Icons.toggle_on : Icons.toggle_off),
            onPressed: () {
              setState(() {
                showStorybook = !showStorybook;
              });
            },
            tooltip: showStorybook ? 'Show Default' : 'Show Storybook',
          ),
        ],
      ),
      body: showStorybook
          ? Storybook(
              initialStory: 'TPECircleIconButton / Customizable',
              wrapperBuilder: (context, child) => Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey.shade100,
                child: child,
              ),
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
                        Option(label: 'Home', value: Icons.home),
                        Option(label: 'Favorite', value: Icons.favorite),
                        Option(label: 'Search', value: Icons.search),
                        Option(label: 'Person', value: Icons.person),
                      ],
                    );

                    final badgeCount = context.knobs.sliderInt(
                      label: 'Badge Count',
                      description: 'Set to 0 for no badge',
                      initial: 0,
                      max: 15,
                    );

                    final backgroundColor = context.knobs.options<Color>(
                      label: 'Background Color',
                      initial: TPEColors.blue80,
                      options: const [
                        Option(label: 'TPE Blue', value: TPEColors.blue80),
                        Option(
                            label: 'TPE Blue Light', value: TPEColors.blue60),
                        Option(label: 'TPE Red', value: TPEColors.red80),
                        Option(label: 'TPE Red Light', value: TPEColors.red60),
                        Option(label: 'TPE Green', value: TPEColors.green80),
                        Option(
                            label: 'TPE Green Light', value: TPEColors.green60),
                        Option(label: 'TPE Grey', value: Colors.grey),
                        Option(label: 'Purple', value: Colors.purple),
                        Option(label: 'Orange', value: Colors.orange),
                      ],
                    );

                    final iconColor = context.knobs.options<Color>(
                      label: 'Icon Color',
                      initial: Colors.white,
                      options: const [
                        Option(label: 'White', value: Colors.white),
                        Option(label: 'Black', value: Colors.black),
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Yellow', value: Colors.yellow),
                      ],
                    );

                    final size = context.knobs.options<TPEButtonSize>(
                      label: 'Button Size',
                      initial: TPEButtonSize.medium,
                      options: const [
                        Option(label: 'Small', value: TPEButtonSize.small),
                        Option(label: 'Medium', value: TPEButtonSize.medium),
                      ],
                    );

                    final isEnabled = context.knobs.boolean(
                      label: 'Enabled',
                      initial: true,
                    );

                    // Convert TPEButtonSize to actual size value
                    double getSizeValue(TPEButtonSize size) {
                      switch (size) {
                        case TPEButtonSize.small:
                          return 40;
                        case TPEButtonSize.medium:
                          return 48;
                      }
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TPECircleIconButton(
                          icon: icon,
                          badgeCount: badgeCount > 0 ? badgeCount : null,
                          backgroundColor: backgroundColor,
                          iconColor: iconColor,
                          size: getSizeValue(size),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$icon button pressed"),
                                backgroundColor: Colors.green.shade700,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Current Settings:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Icon: $icon',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          'Badge: ${badgeCount > 0 ? badgeCount : "None"}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          'Size: $size',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          'Enabled: $isEnabled',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Story(
                  name: 'TPECircleIconButton / Examples',
                  builder: (context) {
                    return ListView(
                      children: [
                        _buildExampleSection(context, 'Common Actions', [
                          _ExampleButtonConfig(
                            icon: Icons.logout,
                            label: 'Logout',
                            backgroundColor: TPEColors.red80,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.shopping_cart,
                            label: 'Cart',
                            backgroundColor: TPEColors.blue80,
                            badgeCount: 3,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.notifications,
                            label: 'Notifications',
                            backgroundColor: TPEColors.green80,
                            badgeCount: 7,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.settings,
                            label: 'Settings',
                            backgroundColor: TPEColors.blue70,
                          ),
                        ]),
                        _buildExampleSection(context, 'Navigation', [
                          _ExampleButtonConfig(
                            icon: Icons.home,
                            label: 'Home',
                            backgroundColor: Colors.purple,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.search,
                            label: 'Search',
                            backgroundColor: Colors.orange,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.person,
                            label: 'Profile',
                            backgroundColor: Colors.teal,
                            badgeCount: 1,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.favorite,
                            label: 'Favorites',
                            backgroundColor: Colors.pink,
                          ),
                        ]),
                        _buildExampleSection(context, 'Different Sizes', [
                          _ExampleButtonConfig(
                            icon: Icons.star,
                            label: 'Small',
                            backgroundColor: Colors.amber,
                            size: TPEButtonSize.small,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.star,
                            label: 'Medium',
                            backgroundColor: Colors.amber,
                            size: TPEButtonSize.medium,
                          ),
                        ]),
                        _buildExampleSection(context, 'Disabled Buttons', [
                          _ExampleButtonConfig(
                            icon: Icons.lock,
                            label: 'Locked',
                            backgroundColor: Colors.grey,
                            isEnabled: false,
                          ),
                          _ExampleButtonConfig(
                            icon: Icons.notifications_off,
                            label: 'Disabled',
                            backgroundColor: Colors.grey.shade400,
                            isEnabled: false,
                          ),
                        ]),
                      ],
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'TPE Circle Icon Button Examples',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      TPECircleIconButton(
                        icon: Icons.logout,
                        backgroundColor: TPEColors.red80,
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Logout Button pressed"),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      TPECircleIconButton(
                        icon: Icons.shopping_cart,
                        backgroundColor: TPEColors.blue80,
                        badgeCount: 3,
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Cart Button pressed"),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                      TPECircleIconButton(
                        icon: Icons.notifications,
                        backgroundColor: TPEColors.green80,
                        badgeCount: 7,
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Notifications Button pressed"),
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                      TPECircleIconButton(
                        icon: Icons.settings,
                        backgroundColor: TPEColors.blue70,
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Settings Button pressed"),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Toggle the switch in app bar to see Storybook',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildExampleSection(
    BuildContext context,
    String title,
    List<_ExampleButtonConfig> configs,
  ) {
    // Convert TPEButtonSize to actual size value
    double getSizeValue(TPEButtonSize size) {
      switch (size) {
        case TPEButtonSize.small:
          return 40;
        case TPEButtonSize.medium:
          return 48;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: configs.map((config) {
              return Column(
                children: [
                  TPECircleIconButton(
                    icon: config.icon,
                    badgeCount: config.badgeCount,
                    backgroundColor: config.backgroundColor,
                    size: getSizeValue(config.size),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${config.label} Button pressed"),
                          backgroundColor: config.backgroundColor,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  Text(
                    config.label,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }
}

class _ExampleButtonConfig {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final int? badgeCount;
  final TPEButtonSize size;
  final bool isEnabled;

  _ExampleButtonConfig({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    this.badgeCount,
    this.size = TPEButtonSize.medium,
    this.isEnabled = true,
  });
}
