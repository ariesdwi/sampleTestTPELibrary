import 'package:flutter/material.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart';

class TPEBiometricBottomSheetPage extends StatefulWidget {
  const TPEBiometricBottomSheetPage({super.key});

  @override
  State<TPEBiometricBottomSheetPage> createState() =>
      _TPEBiometricBottomSheetPageState();
}

class _TPEBiometricBottomSheetPageState
    extends State<TPEBiometricBottomSheetPage> {
  void _openBiometricSheet() {
    showTPEBiometricBottomSheet(
      context: context,
      onAuthenticated: () {
        // e.g., Navigate to dashboard
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Authentication successful")),
        );
      },
      onError: (err) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(err)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TPE Biometric Bottom Sheet')),
      body: Center(
        child: ElevatedButton(
          onPressed: _openBiometricSheet,
          child: const Text("Open Biometric Bottom Sheet"),
        ),
      ),
    );
  }
}
