import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:tpe_component_sdk/utils/top_modal.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart'; // Assuming this contains showTPELoginBottomSheet

class TpeLoginPageTW extends StatefulWidget {
  const TpeLoginPageTW({super.key});

  @override
  State<TpeLoginPageTW> createState() => _LoginPageState();
}

class _LoginPageState extends State<TpeLoginPageTW> {
  bool checkboxValue = false;

  void _openLoginSheet() {
    showTPELoginBottomSheet(
      context: context,
      loginType: 'tw',
      titleText: "Login TW",
      onSaveSuccess: (data) {
<<<<<<< HEAD
        if ("${data['username']}" != "Farischa" &&
            "${data['password']}" != "Farischa123") {
          showTopSnackBar(
              Overlay.of(context),
              TopModal.error(
                  message:
                      "Incorrect Password or Username. Please Try and Check again"));

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text("username should : Farischa, password : Farischa123")),
          );
        }
=======
        print("ID Card: ${data['idcard']}");
        print("Username: ${data['username']}");
        print("Password: ${data['password']}");
        print("Checkbox: ${data['checkbox']}");
>>>>>>> f619c88 (Update)
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
