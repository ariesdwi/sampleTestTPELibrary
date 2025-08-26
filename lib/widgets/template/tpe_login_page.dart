import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart'; // Assuming this contains showTPELoginBottomSheet

class TpeLoginPage extends StatefulWidget {
  const TpeLoginPage({super.key});

  @override
  State<TpeLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<TpeLoginPage> {
  final form = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  bool checkboxValue = false;

  void _openLoginSheet() {
    showTPELoginBottomSheet(
      context: context,
      loginType: 'tl', // Use string 'tl'
      titleText: "Login TL",
      onSaveSuccess: (data) {
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
      },
    );
  }

  void _openBiometricSheet() {
    showTPEBiometricBottomSheet(
      context: context,
      onAuthenticated: () {
        // e.g., Navigate to dashboard
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Authentication successful")),
        );
        Navigator.pop(context);
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
    return TpeTemplateLoginTl(
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
    );
  }
}
