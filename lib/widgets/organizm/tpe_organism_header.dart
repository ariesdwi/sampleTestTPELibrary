import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentHeader extends StatefulWidget {
  const TPEComponentHeader({super.key});

  @override
  State<TPEComponentHeader> createState() => _TPEComponentHeaderState();
}

class _TPEComponentHeaderState extends State<TPEComponentHeader> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Header"),
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        actions: [
          IconButton(
            icon: Icon(showStorybook ? Icons.settings : Icons.settings),
            onPressed: () {
              setState(() {
                showStorybook = !showStorybook;
              });
            },
            tooltip: showStorybook ? 'Show Examples' : 'Show Storybook',
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: showStorybook ? _buildStorybook() : _buildExamples(),
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Single Line Example
          _buildHeaderExample(
            "Single Line Header",
            TPEHeaderComponent(
              userName: "John Doe",
              greeting: "Welcome",
              singleLineType: true,
              rightCircleButton: TPECircleIconButton(
                icon: Icons.notifications,
                badgeCount: 3,
                onPressed: () {},
              ),
            ),
          ),

          const SizedBox(height: 2),

          // Double Line Example
          _buildHeaderExample(
            "Double Line Header",
            TPEHeaderComponent(
              userName: "Jane Smith",
              greeting: "Good morning",
              singleLineType: false,
              rightCircleButton: TPECircleIconButton(
                icon: Icons.settings,
                onPressed: () {},
              ),
            ),
          ),

          const SizedBox(height: 2),

          // Without Right Button
          _buildHeaderExample(
            "Without Right Button",
            TPEHeaderComponent(
              userName: "Robert Johnson",
              greeting: "Hello",
              singleLineType: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderExample(String title, Widget header) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: header,
        ),
      ],
    );
  }

  Widget _buildStorybook() {
    return Container(
      color: const Color.fromARGB(
          255, 253, 253, 253), // Dark background for the entire storybook
      padding: const EdgeInsets.all(16),
      child: Storybook(
        stories: [
          Story(
            name: 'Header Customization',
            builder: (context) {
              final userName = context.knobs.text(
                label: 'User Name',
                initial: 'Aries',
              );

              final greeting = context.knobs.text(
                label: 'Greeting',
                initial: 'Welcome',
              );

              final singleLine = context.knobs.boolean(
                label: 'Single Line',
                initial: true,
              );

              final showRightButton = context.knobs.boolean(
                label: 'Show Right Button',
                initial: true,
              );

              final iconChoice = context.knobs.options<String>(
                label: 'Right Icon',
                initial: 'notifications',
                options: const [
                  Option(label: 'Notifications', value: 'notifications'),
                  Option(label: 'Settings', value: 'settings'),
                  Option(label: 'Logout', value: 'logout'),
                ],
              );

              return Card(
                color: Colors.grey[800], // Dark card background
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TPEHeaderComponent(
                    userName: userName,
                    greeting: greeting,
                    singleLineType: singleLine,
                    rightCircleButton: showRightButton
                        ? TPECircleIconButton(
                            icon: _getIconByName(iconChoice),
                            onPressed: () => debugPrint("Icon tapped"),
                          )
                        : null,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _getIconByName(String name) {
    switch (name) {
      case 'settings':
        return Icons.settings;
      case 'logout':
        return Icons.logout;
      default:
        return Icons.notifications;
    }
  }
}
