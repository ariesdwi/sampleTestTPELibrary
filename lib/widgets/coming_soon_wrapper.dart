import 'package:flutter/material.dart';

class ComingSoonWrapper extends StatelessWidget {
  final Widget child;
  final bool isComingSoon;

  const ComingSoonWrapper({
    super.key,
    required this.child,
    this.isComingSoon = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isComingSoon) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.construction, size: 80, color: Colors.orange),
              SizedBox(height: 16),
              Text(
                "Coming Soon",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("This feature is still under development."),
            ],
          ),
        ),
      );
    } else {
      return child;
    }
  }
}
