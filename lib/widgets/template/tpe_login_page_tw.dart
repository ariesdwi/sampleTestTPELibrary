import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart'; // Assuming this contains showTPELoginBottomSheet

class TpeLoginPageTW extends StatefulWidget {
  const TpeLoginPageTW({super.key});

  @override
  State<TpeLoginPageTW> createState() => _LoginPageState();
}

class _LoginPageState extends State<TpeLoginPageTW> {
  final form = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  bool checkboxValue = false;

  void _openLoginSheet() {
    showTPELoginBottomSheet(
      context: context,
      showIdCardField: false,
      showCheckbox: false,
      titleText: "Login TW",
      onSaveSuccess: (data) {
        // print("Username: ${data['username']}");
        // print("Password: ${data['password']}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TpeTemplateLoginTW(
      backgroundUrl:
          "https://raw.githubusercontent.com/flutter/website/main/src/_assets/image/flutter-lockup-bg.jpg",
      backgroundAlignment: Alignment.center,
      title: "Your Financial Partner On The Go!",
      subtitle:
          "BRImo Timor-Leste is your go-to solution for hassle-free banking. Make your transaction always simple, always accessible.",
      loginText: "Login",
      onLoginTap: _openLoginSheet, // ✅ Connect login button
      onRegisterTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Register Tap",
            ),
          ),
        );
      },
      cardHeight: 320,
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
      onLanguageTap: (String selectedcode, String selectedLanguage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Bahasa dipilih: $selectedLanguage"),
          ),
        );
      },
    );
  }
}
