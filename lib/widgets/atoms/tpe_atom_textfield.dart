import 'package:flutter/material.dart';
import 'package:tpe_component_sdk/components/field/tpe_input_textfield.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TPEAtomTextField extends StatelessWidget {
  TPEAtomTextField({super.key});

  final FormGroup form = FormGroup({
    'Username': FormControl<String>(validators: [Validators.required]),
    'Password': FormControl<String>(validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TPE Text Field")),
        body: ReactiveForm(
            formGroup: form,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TPEInputTextField(
                  formControlName: 'Username',
                  validationMessages: {
                    ValidationMessage.required: (_) => "Wajib diisi!",
                  },
                ),
              ),
            )));
  }
}
