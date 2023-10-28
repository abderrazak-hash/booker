import 'package:flutter/material.dart';

class CheckNetScreen extends StatelessWidget {
  const CheckNetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Check Your Network Connection",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
