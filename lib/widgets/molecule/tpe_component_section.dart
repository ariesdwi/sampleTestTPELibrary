import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

class TPEComponentSection extends StatefulWidget {
  const TPEComponentSection({super.key});

  @override
  State<TPEComponentSection> createState() => _TPEComponentSectionState();
}

class _TPEComponentSectionState extends State<TPEComponentSection> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Section Header"),
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
      body: showStorybook ? _buildStorybook() : _buildDefaultView(),
    );
  }

  Widget _buildDefaultView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TpeComponentSectionHeader(
            title: "Aktivitas Terbaru",
            subtitle: "Pantau aktivitas terbarumu",
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildStorybook() {
    return Storybook(
      wrapperBuilder: (context, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: child),
      ),
      stories: [
        Story(
          name: 'TpeComponentSectionHeader / Customizable',
          builder: (context) {
            final title = context.knobs.text(
              label: 'Title',
              initial: 'Aktivitas Terbaru',
            );

            final subtitle = context.knobs.text(
              label: 'Subtitle',
              initial: 'Pantau aktivitas terbarumu',
            );

            return TpeComponentSectionHeader(
              title: title,
              subtitle: subtitle,
            );
          },
        ),
      ],
    );
  }
}
