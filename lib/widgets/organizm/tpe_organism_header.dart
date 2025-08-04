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
      body: Container(
        color: const Color.fromARGB(255, 112, 97, 96),
        child: Center(
          child: showStorybook
              ? _buildStorybook()
              : _buildHeader("Aries", Icons.logout_outlined),
        ),
      ),
    );
  }

  Widget _buildStorybook() {
    return Storybook(
      wrapperBuilder: (context, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
      stories: [
        Story(
          name: 'TPEHeaderComponent / Default',
          builder: (context) {
            final userName = context.knobs.text(
              label: 'User Name',
              initial: 'Aries',
            );

            final showRightButton = context.knobs.boolean(
              label: 'Show Right Button',
              initial: true,
            );

            final iconChoice = context.knobs.options<String>(
              label: 'Right Icon',
              initial: 'logout',
              options: const [
                Option(label: 'Logout', value: 'logout'),
                Option(label: 'Settings', value: 'settings'),
                Option(label: 'Notifications', value: 'notifications'),
              ],
            );

            final icon = _getIconByName(iconChoice);

            return _buildHeader(
              userName,
              showRightButton ? icon : null,
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeader(String userName, IconData? rightIcon) {
    return TPEHeaderComponent(
      userName: userName,
      rightCircleButton: rightIcon != null
          ? TPECircleIconButton(
              icon: rightIcon,
              onPressed: () => debugPrint("Right icon tapped"),
            )
          : null,
    );
  }

  IconData _getIconByName(String name) {
    switch (name) {
      case 'settings':
        return Icons.settings;
      case 'notifications':
        return Icons.notifications_none;
      default:
        return Icons.logout_outlined;
    }
  }
}
