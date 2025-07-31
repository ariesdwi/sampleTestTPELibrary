import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/button/tpe_copy_button.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TPE Copy Button")),
      body: Center(
        child: TPECopyButton(textToCopy: "Copy this text", copyText: "copy",
                  successMessage: "Nomor rekening disalin"),
      ),
    );
  }
}
