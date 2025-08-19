import 'package:flutter/material.dart';
import 'package:tpe_login_sdk/tpe_login_sdk.dart';

class TpeRegisterPage extends StatelessWidget {
  const TpeRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TpeTemplateRegister(
      onRegisterTap: (username, password, confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Register Tap\nUsername: $username\nPassword: $password\nConfirm Password: $confirmPassword",
            ),
          ),
        );
      },
    );
  }
}