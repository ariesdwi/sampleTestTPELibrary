import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart'; // adjust import

class TPELoginBottomSheetPage extends StatefulWidget {
  const TPELoginBottomSheetPage({super.key});

  @override
  State<TPELoginBottomSheetPage> createState() =>
      _TPELoginBottomSheetPageState();
}

class _TPELoginBottomSheetPageState extends State<TPELoginBottomSheetPage> {
  final form = FormGroup({
    'idcard': FormControl<String>(validators: [Validators.required]),
    'username': FormControl<String>(),
    'password': FormControl<String>(),
  });

  bool checkboxValue = false;

  void _openLoginSheet() {
    showTPELoginBottomSheet(
      context: context,
      form: form,
      showIdCardField: true,
      showCheckbox: true,
      titleText: "Login TW",
      onSaveSuccess: () {
        // print("ID Card: ${data['idCard']}");
        // print("Username: ${data['username']}");
        // print("Password: ${data['password']}");
        // print("Checkbox: ${data['checkbox']}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TPE Login Bottom Sheet')),
      body: Center(
        child: ElevatedButton(
          onPressed: _openLoginSheet,
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}
