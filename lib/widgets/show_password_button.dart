import 'package:flutter/material.dart';

class ShowPasswordButton extends StatefulWidget {
  @override
  _ShowPasswordButtonState createState() => _ShowPasswordButtonState();
}

class _ShowPasswordButtonState extends State<ShowPasswordButton> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _showPassword = !_showPassword;
        });
      },
    );
  }
}
