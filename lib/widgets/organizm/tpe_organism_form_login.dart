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
    'field1': FormControl<String>(validators: [Validators.required]),
    'field2': FormControl<String>(),
    'field3': FormControl<String>(),
  });

  bool checkboxValue = false;

  void _openLoginSheet() {
    showTPELoginBottomSheet(
      context: context,
      form: form,
      checkboxValue: checkboxValue,
      onCheckboxChanged: (val) {
        setState(() => checkboxValue = val);
      },
      onSaveSuccess: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "field1: ${form.control('field1').value}, Checkbox: $checkboxValue",
            ),
          ),
        );
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
