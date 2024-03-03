import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" USER HOME SCREEN ")),
      body: Center(
          child: Text(" HELLO THERE ! >>> THE APP IS UNDER DEVELOPMENT")),
    );
  }
}
