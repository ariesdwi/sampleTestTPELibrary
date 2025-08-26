import 'package:flutter/material.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart';

class TpeOrganismLanguage extends StatelessWidget {
  const TpeOrganismLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language BottomSheet"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showTPELanguageBottomSheet(
            context: context,
            initialSelectedLanguageCode: 'id',
            languages: [
              {'code': 'id', 'name': 'Bahasa Indonesia'},
              {'code': 'en', 'name': 'English'},
              {'code': 'es', 'name': 'Spanish'},
              {'code': 'zh', 'name': 'Chinese'},
              {'code': 'ja', 'name': 'Japanese'},
              {'code': 'ko', 'name': 'Korean'},
              {'code': 'pt', 'name': 'Português'},
              {'code': 'fr', 'name': 'Français'},
            ],
            onLanguageTilePressed: (selectedCode, selectedName) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Bahasa dipilih: $selectedName")),
              );
            },
            // buttonText: "Select Language",
            isCheckedTile: true,
          );
        },
        child: const Text("Pilih Bahasa"),
      )),
    );
  }
}
