import 'package:flutter/material.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart';

class TpeOrganismLanguageWithButton extends StatelessWidget {
  const TpeOrganismLanguageWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language BottomSheet"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showTPELanguageBottomSheetWithButton(
              context: context,
              languages: [
                {'code': 'id', 'name': 'Bahasa Indonesia'},
                {'code': 'en', 'name': 'English'},
                {'code': 'es', 'name': 'Spanish'},
                {'code': 'fr', 'name': 'Français'},
              ],
              // buttonText: "Select Language",
              isCheckedTile: false,
              onButtonLanguagePressed: (selectedCode, selectedName) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Bahasa dipilih: $selectedName")),
                );
                Navigator.pop(
                    context); // Close the bottom sheet after selection
              });
        },
        child: const Text("Pilih Bahasa"),
      )),
    );
  }
}
