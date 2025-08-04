
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/components/button/tpe_copy_button.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({super.key});

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Copy Button"),
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
    return const Center(
      child: TPECopyButton(
        textToCopy: "Copy this text",
        copyText: "copy",
        successMessage: "Nomor rekening disalin",
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
          name: 'TPECopyButton / Customizable',
          builder: (context) {
            final copyText = context.knobs.text(
              label: 'Visible Button Text',
              initial: 'copy',
            );

            final textToCopy = context.knobs.text(
              label: 'Text to Copy',
              initial: 'Copy this text',
            );

            final successMessage = context.knobs.text(
              label: 'Success Message',
              initial: 'Nomor rekening disalin',
            );

            return TPECopyButton(
              textToCopy: textToCopy,
              copyText: copyText,
              successMessage: successMessage,
            );
          },
        ),
      ],
    );
  }
}
