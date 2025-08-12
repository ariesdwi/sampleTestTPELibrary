import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TPEMoleculePasswordStorybook extends StatefulWidget {
  const TPEMoleculePasswordStorybook({super.key});

  @override
  State<TPEMoleculePasswordStorybook> createState() =>
      _TPEMoleculePasswordStorybook();
}

class _TPEMoleculePasswordStorybook
    extends State<TPEMoleculePasswordStorybook> {
  bool showStorybook = false;
  String passwordValue = '';
  String confrimPasswordValue = '';

  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      value: '',
      validators: [Validators.required, Validators.email],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Input Username Field"),
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
      body: showStorybook
          ? Storybook(
              wrapperBuilder: (context, child) =>
                  Padding(padding: const EdgeInsets.all(16), child: child),
              stories: [
                Story(
                  name: 'TPEInputTextField / Default',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Title',
                      initial: 'Email',
                    );

                    final label = context.knobs.text(
                      label: 'Label Text',
                      initial: 'Email Address',
                    );

                    final hint = context.knobs.text(
                      label: 'Hint Text',
                      initial: 'Enter your email',
                    );

                    final obscureText = context.knobs.boolean(
                      label: 'Obscure Text',
                      initial: false,
                    );

                    final readOnly = context.knobs.boolean(
                      label: 'Read Only',
                      initial: false,
                    );

                    final toggleVisibility = context.knobs.boolean(
                      label: 'Enable Toggle Visibility',
                      initial: false,
                    );

                    return ReactiveForm(
                      formGroup: form,
                      child: TPEInputTextField(
                        formControlName: 'email',
                        textfieldTitle: title,
                        labelText: label,
                        hintText: hint,
                        obscureText: obscureText,
                        enableToggleVisibility: toggleVisibility,
                        readOnly: readOnly,
                        prefixIcon: Icons.email,
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'This field is required',
                          ValidationMessage.email: (_) => 'Invalid email',
                        },
                      ),
                    );
                  },
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ReactiveForm(
                formGroup: form,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Default Input Field Preview'),
                    const SizedBox(height: 12),
                    TPEPasswordField(
                      onChanged: (value) {
                        passwordValue = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    TPEPasswordField(
                      onChanged: (value) {
                        confrimPasswordValue = value;
                      },
                      hintPassword: 'Confirm Your Password',
                    ),
                    const SizedBox(height: 16),
                    TPERefineButton(
                      title: "Simpan",
                      icon: Icons.save,
                      variant: TPEButtonVariant.primary,
                      size: TPEButtonSize.medium,
                      roundType: TPEButtonRound.pill,
                      isCentered: true,
                      isEnabled: true,
                      isLoading: false,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Simpan pass : $passwordValue, confirm : $confrimPasswordValue!")),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
