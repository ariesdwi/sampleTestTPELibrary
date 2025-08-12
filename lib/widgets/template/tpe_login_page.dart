import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
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
      showIdCardField: false,
      showCheckbox: false,
      titleText: "Login TL",
      onSaveSuccess: (data) => {},
      // onSaveSuccess: () {
      //   print("Username: ${data['username']}");
      //   print("Password: ${data['password']}");
      // },
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